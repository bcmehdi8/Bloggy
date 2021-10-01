// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/backend/model/article_model.dart';
import 'package:travelv2/screens/components/Article/date_writer_card.dart';

import '../../article_page.dart';

class ArticleTitleDescription extends StatefulWidget {
  ArticleTitleDescription({Key? key, required this.data}) : super(key: key);

  final Map data;
  @override
  State<ArticleTitleDescription> createState() =>
      _ArticleTitleDescriptionState();
}

class _ArticleTitleDescriptionState extends State<ArticleTitleDescription> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: Column(children: [
        // Padding only
        Padding(
            padding: EdgeInsets.only(
          top: size.height * 0.007,
        )),
        //Padding with Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            widget.data['title'],
            style: TextStyle(
              fontSize: 30,
              fontFamily: "SF",
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        date_writer(data: widget.data),
        //Padding with Image
        Container(
          padding: EdgeInsets.only(
            top: 10,
          ),
          height: size.height * 0.35,
          width: size.width,
          child: FadeInImage.assetNetwork(
            placeholder: PlaceHolder,
            image: widget.data['image'],
            fit: BoxFit.cover,
          ),
        ),
        // Padding only
        Padding(
            padding: EdgeInsets.only(
          top: size.height * 0.02,
        )),
        //Description
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              widget.data['Description'],
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      ]),
    );
  }
}
