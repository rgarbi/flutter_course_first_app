import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position location;

  Future<Position> getGPSLocation() {
    return getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

  @override
  void initState() {
    super.initState();
    getGPSLocation().asStream().forEach((gpsLocation) {
      location = gpsLocation;
      print(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
