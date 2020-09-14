import 'package:flutter/material.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final bool isActive;

  ReusableCard({this.color, this.child, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: _getCardColor(),
      ),
      child: child,
    );
  }

  Color _getCardColor() {
    return isActive == true ? activeCardColor : inactiveCardColor;
  }
}
