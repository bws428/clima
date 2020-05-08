import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // Lifecycle method "initState"
  // (only runs once, when LoadingScreen is created)
  @override
  void initState() {
    super.initState();
    print('(1) Screen initialized.');
    getLocation();
  }

  void getLocation() async {
    // Not a Pure Function!!
    print('(2) Getting device location...');

    // Create new Location object
    Location location = Location();

    // Wait for location data
    await location.getCurrentLocation();

    // Print to console
    print(location.lat ?? 'Latitude not available.');
    print(location.long ?? 'Longitude not available.');
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if(response.statusCode == 200) {
      String data = response.body;
      print(data);
    }
    else {
      print(response.statusCode);
    }
  }

  // Lifecycle method "build"
  @override
  Widget build(BuildContext context) {
    // 
    print('(3) Build method called.');
    // Grab weather data
    getData();
    return Scaffold(
      body: Center(
        child: Text('Nothing here yet...'),
      ),
    );
  }
}
