import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'genderCardWidget.dart';
import 'reusableCardWidget.dart';
import 'constants.dart';

enum GenderType { male, female }
enum weightCounter { add, subtract }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weightValue = 80;

  // Color maleButtonColor = inactiveButtonColor;
  // Color femaleButtonColor = inactiveButtonColor;
  //
  // changeButtonColor(GenderType gender) {
  //   if (gender == GenderType.male) {
  //     if (maleButtonColor == activeButtonColor)
  //       maleButtonColor = inactiveButtonColor;
  //     else {
  //       maleButtonColor = activeButtonColor;
  //       femaleButtonColor = inactiveButtonColor;
  //     }
  //   } else {
  //     if (femaleButtonColor == activeButtonColor)
  //       femaleButtonColor = inactiveButtonColor;
  //     else {
  //       femaleButtonColor = activeButtonColor;
  //       maleButtonColor = inactiveButtonColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    cardColor: selectedGender == GenderType.male
                        ? kActiveButtonColor
                        : kInactiveButtonColor,
                    cardChild: genderCard(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    cardColor: selectedGender == GenderType.female
                        ? kActiveButtonColor
                        : kInactiveButtonColor,
                    cardChild: genderCard(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ), //The row to show gender cards
          ),//Gender Cards
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        kHeightUnit,
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red[600],
                      inactiveTrackColor: Colors.red[100],
                      trackHeight: 3.0,
                      thumbColor: Colors.red[800],
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 240.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              cardColor: kCardColor,
            ),
          ),//Height Card
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weightValue.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              kWeightUnit,
                              style: kTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circularWidget(
                              iconPassed: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            circularWidget(
                              iconPassed: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),//Weight Card
                Expanded(
                  child: ReusableCard(
                    cardColor: kCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class circularWidget extends StatelessWidget {
  IconData iconPassed;
  Function onPressed;

  circularWidget({@required this.iconPassed, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconPassed),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: onPressed,
    );
  }
}
