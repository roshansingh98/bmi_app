import 'file:///C:/Users/User/All%20Projects/Flutter/bmi_app/lib/components/bottomButtonWidget.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/reusableCardWidget.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiInterpretation;
  final String bmiValue;

  const ResultPage(
      {@required this.bmiResult,
      @required this.bmiInterpretation,
      @required this.bmiValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // To remove the back button
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Results',
                  style: kLargeTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResult.toUpperCase(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiValue,
                    style: kBMINumberStyle,
                  ),
                  Text(
                    bmiInterpretation,
                    style: kBMIOutputTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          moveToDifferentPage(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
