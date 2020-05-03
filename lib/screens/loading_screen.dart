import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

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
    print('initState method called...');
  }

  void getLocation() async {
    // Create new Location object
    Location location = Location();

    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);

    // return location;
  }

  void getData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={owmApiKey}');
    print(response);
  }

  // Lifecycle method "build"
  @override
  Widget build(BuildContext context) {
    print('build method called...');
    getData();
    return Scaffold(
      body: Center(
        child: Text('Latitude: ${location.latitude}'),
      ),
    );
  }
}
