import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_content.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      'Your Result',
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                onTapFunction: () {},
                isActive: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Normal',
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('26.7', style: kBMITextStyle),
                    Text(
                      'You have a higher than normal body weight. Try to exercise more.',
                      style: kDescriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: kBottomButtonColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20),
              height: kBottomContainerHeight,
              child: FlatButton(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
