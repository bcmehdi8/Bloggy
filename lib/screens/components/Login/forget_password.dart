// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

Widget ForgetPassword(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
    child: Center(
        child: Text(
      "Forgot Password ?",
      style: TextStyle(
          fontSize: 16, fontFamily: "Nunito Sans", fontWeight: FontWeight.w600),
    )),
  );
}
