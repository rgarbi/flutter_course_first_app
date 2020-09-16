import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  BottomButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomButtonColor,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      height: kBottomContainerHeight,
      child: FlatButton(
        child: Text(
          text,
          style: kLargeButtonTextStyle,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
