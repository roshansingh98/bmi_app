import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'genderCardWidget.dart';
import 'reusableCardWidget.dart';

const bottomContainerHeight = 60.0;
const cardColor = Color(0xFF1D1E33);
const activeButtonColor = Color(0xFF1D1E33);
const inactiveButtonColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleButtonColor = inactiveButtonColor;
  Color femaleButtonColor = inactiveButtonColor;

  changeButtonColor(int gender) {
    if (gender == 1) {
      if (maleButtonColor == activeButtonColor)
        maleButtonColor = inactiveButtonColor;
      else {
        maleButtonColor = activeButtonColor;
        femaleButtonColor = inactiveButtonColor;
      }
    } else {
      if (femaleButtonColor == activeButtonColor)
        femaleButtonColor = inactiveButtonColor;
      else {
        femaleButtonColor = activeButtonColor;
        maleButtonColor = inactiveButtonColor;
      }
    }
  }

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
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeButtonColor(1);
                      });
                    },
                    child: ReusableCard(
                      cardColor: maleButtonColor,
                      cardChild: genderCard(
                        genderIcon: FontAwesomeIcons.mars,
                        genderText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeButtonColor(2);
                      });
                    },
                    child: ReusableCard(
                      cardColor: femaleButtonColor,
                      cardChild: genderCard(
                        genderIcon: FontAwesomeIcons.venus,
                        genderText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: cardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: cardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
