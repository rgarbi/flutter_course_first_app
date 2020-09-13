import 'package:flutter/material.dart';

const labelTestStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContentWidget extends StatelessWidget {
  final String text;
  final IconData iconography;

  IconContentWidget({this.text, this.iconography});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconography,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: labelTestStyle,
        ),
      ],
    );
  }
}
