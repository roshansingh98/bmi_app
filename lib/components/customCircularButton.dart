import 'package:flutter/material.dart';

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
