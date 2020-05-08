import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/utilities/keys.dart';

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
    double lat = location.lat;
    double lon = location.long;

    // Wait for location data
    await location.getCurrentLocation();

    print('Lat: $lat, Lon: $lon');

  }

  void getData() async {
    http.Response response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    if(response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      
      // Temp, condition number, city name
      String cityName = decodedData['name'];
      String country = decodedData['sys']['country'];
      double tempK = decodedData['main']['temp'];
      double tempC = tempK-273.15;
      int condition = decodedData['weather'][0]['id'];

      print('City: $cityName, $country');
      print('Temperature: ${tempC.toStringAsFixed(0)} C');
      print('Condition code: $condition');
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
