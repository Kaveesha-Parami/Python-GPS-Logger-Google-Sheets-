# Python Sample: Insert data into a simulated database (dictionary)

devices = [
    {"DeviceID": "D001", "Name": "Front Door Sensor", "Type": "Sensor", 
     "Model": "X100", "Status": "Online", "LinkedUser": "U001"}
]

device_locations = [
    {"LocationID": "L001", "DeviceID": "D001", "Latitude": 7.290571, 
     "Longitude": 80.633728, "Accuracy": 5.0, "Timestamp": "2025-08-26T05:30:00Z"}
]

users = [
    {"UserID": "U001", "Name": "Alice Perera", "Email": "alice@example.com"}
]

voice_commands = [
    {"CommandID": "C001", "CommandPhrase": "Find my device", "Action": "locate_device", 
     "Description": "Locate linked IoT device", "ExampleUsage": "Find my phone"}
]

routes = [
    {"RouteID": "R001", "UserID": "U001", "DeviceID": "D001", "StartLat": 7.2900, "StartLng": 80.6000,
     "EndLat": 7.290571, "EndLng": 80.633728, "Distance": 5.2, "ETA": 12, 
     "TrafficInfo": "Moderate", "Timestamp": "2025-08-26T05:35:00Z"}
]

print("Devices:", devices)
print("Device Locations:", device_locations)
print("Users:", users)
print("Voice Commands:", voice_commands)
print("Routes:", routes)
