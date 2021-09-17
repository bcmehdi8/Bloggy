// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'components/Home/body.dart'; // import this

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHolder(),
      body: Body(),
    );
  }
}

AppBar appBarHolder() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      "BBC",
      style: (TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )),
    ),
    elevation: 0,
    actions: [
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      )
    ],
  );
}
