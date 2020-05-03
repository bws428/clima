import 'package:geolocator/geolocator.dart';

// Create a Location class for lat/long
class Location {
  // Properties
  double latitude;
  double longitude;

  // Constructor
  Location();

  // Methods
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
