// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

Widget signInMessage(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.height * 0.2,
    decoration: const BoxDecoration(color: Color(0xFFFFB900)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign In",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 30,
                  fontWeight: FontWeight.w900)),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "We can't wait to see you enjoying time \nwith Bloggy community",
            style: TextStyle(
                fontFamily: "Inter", fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

Widget signUpMessage(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    height: size.height * 0.2,
    decoration: BoxDecoration(color: Color(0xFFFFB900)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign Up",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 30,
                  fontWeight: FontWeight.w900)),
          SizedBox(
            height: 10,
          ),
          Text(
            "We can't wait to see you enjoying time \nwith Bloggy community",
            style: TextStyle(
                fontFamily: "Inter", fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
