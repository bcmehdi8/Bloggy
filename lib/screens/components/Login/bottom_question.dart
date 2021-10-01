// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelv2/config/constants.dart';

Widget SigninQuestion(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0),
    child: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/', arguments: {});
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Already have an account? ",
              style: TextStyle(color: Colors.black87, fontFamily: "Open Sans")),
          TextSpan(
              text: "Sign in",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Open Sans"))
        ])),
      ),
    ),
  );
}

Widget RegisterQuestion(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.009),
    child: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/signup_page', arguments: {});
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(color: Colors.black87, fontFamily: "Open Sans")),
          TextSpan(
              text: "Sign up",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Open Sans"))
        ])),
      ),
    ),
  );
}
