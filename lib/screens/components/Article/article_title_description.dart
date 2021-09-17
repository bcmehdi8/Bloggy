// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

class ArticleTitleDescription extends StatelessWidget {
  const ArticleTitleDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.only(
          top: kDefaultPadding,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Reasons Why Flutter is Setting the Trend in Mobile App Development in 2021.",
            style: TextStyle(
              fontSize: 32,
              fontFamily: "Open sans",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
          top: kDefaultPadding * 1.2,
        )),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            height: 200,
            width: size.width,
            child: Image.network(
              "https://www.bostonmagazine.com/wp-content/uploads/sites/2/2020/11/fea_change-1.jpg",
              fit: BoxFit.cover,
            )),
        Padding(
            padding: EdgeInsets.only(
          top: kDefaultPadding * 1.2,
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Flutter is free, and open-source Software Development Kit(SDK) used to develop high performing Android and iOS applications with the single code base. It is a dynamic, cross-platform framework, launched by Google in 2018 with all the integrated widgets and tools that result in faster app development. \n\n Flutter is empowered with a layered structure, so developers can build highly customized and attractive app solutions in less time without compromising with the performance. Also, making changes in the Flutter codebase is quite more comfortable and quicker as it owns a hot reload feature which reflects instant changes in the codebase within milliseconds.Since Flutter has the wealthiest set of inbuilt widgets, customization of the app becomes far easier. Even if you want to develop an iOS app different from an Android app or you feel like to have two different themes, then also it is possible with Flutter.The next thing you need to check is the cross-platform compatibility of the app development framework. And for your business, you always want to go to the framework that success in a fast-paced and fast-growing industry. For this, you need to make sure that your app will smoothly run on a different platform to reach a broader market and remain competitive.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 19, fontFamily: "Lato"),
            ),
          ),
        ),
      ]),
    );
  }
}
