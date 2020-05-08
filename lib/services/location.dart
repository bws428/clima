import 'package:geolocator/geolocator.dart';

// Create a Location class for lat/long
class Location {
  // Properties
  double lat;
  double long;

  // Constructor
  Location();

  // Methods
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
