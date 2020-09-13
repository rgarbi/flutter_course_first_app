import 'package:bmi_calculator/reusable_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const Color backgroundCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const Color bottomButtonColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMaleButtonActive = false;
  bool isFemaleButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMaleButtonActive = true;
                          isFemaleButtonActive = false;
                        });
                      },
                      child: ReusableCard(
                        isActive: isMaleButtonActive,
                        child: IconContentWidget(
                          text: 'MALE',
                          iconography: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemaleButtonActive = true;
                          isMaleButtonActive = false;
                        });
                      },
                      child: ReusableCard(
                        color: backgroundCardColor,
                        isActive: isFemaleButtonActive,
                        child: IconContentWidget(
                          text: 'FEMALE',
                          iconography: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: backgroundCardColor,
                      isActive: true,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: backgroundCardColor,
                      isActive: true,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: backgroundCardColor,
                      isActive: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomButtonColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
