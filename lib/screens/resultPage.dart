import 'file:///C:/Users/User/All%20Projects/Flutter/bmi_app/lib/components/bottomButtonWidget.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/reusableCardWidget.dart';

class ResultPage extends StatelessWidget {
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
                    'Normal',
                    style: kBMITextStyle,
                  ),
                  Text(
                    '20',
                    style: kBMINumberStyle,
                  ),
                  Text(
                    'You are just fine. Go on having a great day.',
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
