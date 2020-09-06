import 'package:flutter/material.dart';

import '../constants.dart';

class moveToDifferentPage extends StatelessWidget {
  final Function onPressed;
  final String text;

  moveToDifferentPage({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.blue,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
