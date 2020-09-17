import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            Position position =
                await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
            print(position.toString());
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
