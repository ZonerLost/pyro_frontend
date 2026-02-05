// models/profile.dart
class Profile {
  String fullName;
  String phoneNumber;
  String address;
  String? profilePicture; // URL or path
  List<Location> locations;
  List<Device> devices;

  Profile({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    this.profilePicture,
    this.locations = const [],
    this.devices = const [],
  });
}

// models/location.dart
class Location {
  String locationName;
  String country;
  String state;
  String address;

  Location({
    required this.locationName,
    required this.country,
    required this.state,
    required this.address,
  });
}

// models/device.dart
class Device {
  String deviceName;
  String brandName;
  String model;
  String serialNumber;
  List<String> uploadedPictures;

  Device({
    required this.deviceName,
    required this.brandName,
    required this.model,
    required this.serialNumber,
    this.uploadedPictures = const [],
  });
}
