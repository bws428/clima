import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  // Lifecycle method "initState"
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    // Create new Location object
    Location location = Location();
  
    // Wait for location data
    await location.getCurrentLocation();

    latitude = location.lat;
    longitude = location.long;

    getData();
  }

  void getData() async {

      
      // Temp, condition number, city name
      String cityName = decodedData['name'];
      String country = decodedData['sys']['country'];
      double tempK = decodedData['main']['temp'];
      double tempC = tempK - 273.15;
      double tempF = tempC * 9/5 + 32;
      String conditions = decodedData['weather'][0]['main'];

      print('City: $cityName, $country');
      print('Temperature: ${tempF.toStringAsFixed(0)}°F');
      print('Conditions: $conditions');
    }
    else {
      print(response.statusCode);
    }
  }

  // Lifecycle method "build"
  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      body: Center(
        child: Text('Loading weather...'),
     
     
     


     
      ),
    );
  }
}
