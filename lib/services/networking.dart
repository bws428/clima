import 'package:clima/utilities/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  // Properties
  final String          url;

  // Constructor
  NetworkHelper(this.url);

  // Methods
  void getData() async {





    
http.Response response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if(response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
  }
}