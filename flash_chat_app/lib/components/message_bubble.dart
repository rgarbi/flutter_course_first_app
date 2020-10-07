import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final BorderRadius pointRight = BorderRadius.only(
    topLeft: Radius.circular(30.0),
    bottomLeft: Radius.circular(30.0),
    bottomRight: Radius.circular(30.0),
  );
  final BorderRadius pointLeft = BorderRadius.only(
    bottomLeft: Radius.circular(30.0),
    bottomRight: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  );

  MessageBubble(
      {@required this.sender, @required this.text, @required this.currentUser});

  final String sender;
  final String currentUser;
  final String text;

  bool isSameUser() {
    return currentUser == sender;
  }

  Color getBackgroundColor() {
    return isSameUser() ? Colors.lightBlueAccent : Colors.white70;
  }

  BorderRadius getBorderRadius() {
    return isSameUser() ? pointRight : pointLeft;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$sender',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          Material(
            borderRadius: getBorderRadius(),
            elevation: 5.0,
            color: getBackgroundColor(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
