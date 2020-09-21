import 'package:flutter/material.dart';
import 'package:weather_app/auth/keys.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    final Location location = Location();
    await location.getCurrentLocation();
    await getData(location.latitude, location.longitude);
  }

  Future<void> getData(lat, long) async {
    Secret secret =
        await SecretLoader(secretPath: 'assets/secrets.json').load();
    String key = secret.apikey;

    var weatherData = await NetworkHelper(
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$key')
        .getData();
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
