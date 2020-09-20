import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    final Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    getData(location.latitude, location.longitude);
  }

  Future<void> getData(lat, long) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=');

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var decodedData = jsonDecode(data);

      double longitue = decodedData['coord']['lon'];
      double temperature = decodedData['main']['temp'];
      String condition = decodedData['weather'][0]['id'];
      String name = decodedData['name'];

      print(longitue);
      print(temperature);
      print(condition);
      print(name);

      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      print(weatherDescription);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
