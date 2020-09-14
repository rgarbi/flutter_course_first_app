import 'package:flutter/material.dart';

import 'constants.dart';


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
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
