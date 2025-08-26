// Java Classes to represent the schema

class Device {
    String DeviceID, Name, Type, Model, Status, LinkedUser;
}

class DeviceLocation {
    String LocationID, DeviceID, Timestamp;
    double Latitude, Longitude, Accuracy;
}

class User {
    String UserID, Name, Email;
}

class VoiceCommand {
    String CommandID, CommandPhrase, Action, Description, ExampleUsage;
}

class Route {
    String RouteID, UserID, DeviceID, TrafficInfo, Timestamp;
    double StartLat, StartLng, EndLat, EndLng, Distance;
    int ETA;
}

// Example usage
public class Main {
    public static void main(String[] args) {
        User u = new User();
        u.UserID = "U001";
        u.Name = "Alice Perera";
        u.Email = "alice@example.com";
        System.out.println("User: " + u.Name + " (" + u.Email + ")");
    }
}
