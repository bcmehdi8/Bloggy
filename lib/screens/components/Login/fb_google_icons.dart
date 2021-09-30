// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelv2/config/constants.dart';

Widget fbGoogleIcons(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(top: size.height * 0.01),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.facebook,
              color: Colors.blue,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 30,
            )),
      ],
    ),
  );
}
