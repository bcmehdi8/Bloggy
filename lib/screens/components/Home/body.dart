// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/components/Home/recent_news.dart';
import 'package:travelv2/screens/components/Home/title_more_btn.dart';

import 'categories_holder.dart';
import 'header_text_searchbox.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderTextSearchBox(size: size),
            categoriesHolder(),
            TitleWithMoreBtn(title: "Latest News", press: () {}),
             recentNews(),
          ]),
    );
  }
}
