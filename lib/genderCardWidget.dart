import 'package:flutter/material.dart';

// ignore: camel_case_types
class genderCard extends StatelessWidget {
  genderCard({this.genderIcon, this.genderText});

  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderText,
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      ],
    );
  }
}
