import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/auth/keys.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const doubleBounce = SpinKitDoubleBounce(
  color: Colors.white,
  size: 50.0,
);

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

    var data = await NetworkHelper(
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$key&units=imperial')
        .getData();

    double temperature = data['main']['temp'];
    int condition = data['weather'][0]['id'];
    String cityName = data['name'];

    final WeatherData weatherData =
        WeatherData(temperature, condition, cityName);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: doubleBounce,
      ),
    );
  }
}
