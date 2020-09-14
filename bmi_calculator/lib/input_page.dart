import 'package:bmi_calculator/reusable_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

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
                    child: ReusableCard(
                      onTapFunction: () {
                        _determineButtonState(Gender.male);
                      },
                      isActive: isMaleButtonActive,
                      child: IconContentWidget(
                        text: 'MALE',
                        iconography: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapFunction: () {
                        _determineButtonState(Gender.female);
                      },
                      color: kBackgroundCardColor,
                      isActive: isFemaleButtonActive,
                      child: IconContentWidget(
                        text: 'FEMALE',
                        iconography: FontAwesomeIcons.venus,
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
                      onTapFunction: () {},
                      color: kBackgroundCardColor,
                      isActive: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                '180',
                                style: kLargeTextStyle,
                              ),
                              Text(
                                'in',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                        ],
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
                      onTapFunction: () {},
                      isActive: true,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapFunction: () {},
                      isActive: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomButtonColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
