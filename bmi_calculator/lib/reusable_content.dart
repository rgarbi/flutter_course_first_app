import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool isActive;
  final Function onTapFunction;

  ReusableCard(
      {this.color, this.child, this.isActive, @required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _getCardColor(),
        ),
        child: child,
      ),
    );
  }

  Color _getCardColor() {
    return isActive == true ? kActiveCardColor : kInactiveCardColor;
  }
}
