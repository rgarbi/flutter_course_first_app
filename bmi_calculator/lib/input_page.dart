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

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  bool isMaleButtonActive = false;
  bool isFemaleButtonActive = false;

  _determineButtonState(Gender gender) {
    setState(() {
      switch (gender) {
        case Gender.male:
          isMaleButtonActive = true;
          isFemaleButtonActive = false;
          break;
        case Gender.female:
          isFemaleButtonActive = true;
          isMaleButtonActive = false;
          break;
        default:
          isFemaleButtonActive = false;
          isMaleButtonActive = false;
          break;
      }
    });
  }

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
                        _determineButtonState(Gender.male);
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
                        _determineButtonState(Gender.female);
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
                      //color: backgroundCardColor,
                      isActive: true,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      //color: backgroundCardColor,
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
