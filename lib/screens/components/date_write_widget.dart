// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

class date_writer extends StatelessWidget {
  const date_writer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.1),
      height: size.height * 0.12,
      width: size.width,
      color: Colors.amber.shade100,
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              "https://cdn.dribbble.com/users/1897247/screenshots/6106869/razor-logo.jpg?compress=1&resize=400x300",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: size.height,
              width: 3,
              color: Colors.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "10 October 2021",
                style: TextStyle(
                  fontFamily: "Lato",
                ),
              ),
              Text("Jane Austen",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: "Lato",
                      fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
