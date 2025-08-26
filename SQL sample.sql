import sqlite3

# --- Connect to SQLite (creates file if not exists) ---
conn = sqlite3.connect("iot_prototype.db")
cursor = conn.cursor()

# --- Create Tables ---
cursor.execute("""
CREATE TABLE IF NOT EXISTS Users (
    UserID TEXT PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Devices (
    DeviceID TEXT PRIMARY KEY,
    Name TEXT NOT NULL,
    Type TEXT NOT NULL,
    Model TEXT NOT NULL,
    Status TEXT NOT NULL,
    LinkedUser TEXT,
    FOREIGN KEY (LinkedUser) REFERENCES Users(UserID)
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS DeviceLocations (
    LocationID TEXT PRIMARY KEY,
    DeviceID TEXT,
    Latitude REAL,
    Longitude REAL,
    Accuracy REAL,
    Timestamp TEXT,
    FOREIGN KEY (DeviceID) REFERENCES Devices(DeviceID)
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS VoiceCommands (
    CommandID TEXT PRIMARY KEY,
    CommandPhrase TEXT NOT NULL,
    Action TEXT NOT NULL,
    Description TEXT,
    ExampleUsage TEXT
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Routes (
    RouteID TEXT PRIMARY KEY,
    UserID TEXT,
    DeviceID TEXT,
    StartLat REAL,
    StartLng REAL,
    EndLat REAL,
    EndLng REAL,
    Distance REAL,
    ETA INTEGER,
    TrafficInfo TEXT,
    Timestamp TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (DeviceID) REFERENCES Devices(DeviceID)
)
""")

# --- Insert Sample Data ---
cursor.execute("INSERT OR IGNORE INTO Users VALUES (?, ?, ?)", 
               ("U001", "Alice Perera", "alice@example.com"))

cursor.execute("INSERT OR IGNORE INTO Devices VALUES (?, ?, ?, ?, ?, ?)", 
               ("D001", "Front Door Sensor", "Sensor", "X100", "Online", "U001"))

cursor.execute("INSERT OR IGNORE INTO DeviceLocations VALUES (?, ?, ?, ?, ?, ?)", 
               ("L001", "D001", 7.290571, 80.633728, 5.0, "2025-08-26T05:30:00Z"))

cursor.execute("INSERT OR IGNORE INTO VoiceCommands VALUES (?, ?, ?, ?, ?)", 
               ("C001", "Find my device", "locate_device", "Locate linked IoT device", "Find my phone"))

cursor.execute("INSERT OR IGNORE INTO Routes VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
               ("R001", "U001", "D001", 7.2900, 80.6000, 7.290571, 80.633728, 5.2, 12, "Moderate", "2025-08-26T05:35:00Z"))

conn.commit()

# --- Fetch and Print Data ---
print("\n=== Users ===")
for row in cursor.execute("SELECT * FROM Users"):
    print(row)

print("\n=== Devices ===")
for row in cursor.execute("SELECT * FROM Devices"):
    print(row)

print("\n=== Device Locations ===")
for row in cursor.execute("SELECT * FROM DeviceLocations"):
    print(row)

print("\n=== Voice Commands ===")
for row in cursor.execute("SELECT * FROM VoiceCommands"):
    print(row)

print("\n=== Routes ===")
for row in cursor.execute("SELECT * FROM Routes"):
    print(row)

# --- Close Connection ---
conn.close()
