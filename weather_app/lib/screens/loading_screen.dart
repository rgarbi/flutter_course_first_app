import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
    Response response = await get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=362729bc632de91186b95e9950f5d46e');
    print(response.body);
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
