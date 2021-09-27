// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/backend/model/article_model.dart';

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
        Padding(
            padding: EdgeInsets.only(
          top: kDefaultPadding / 3,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            widget.data['title'],
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
          // padding: EdgeInsets.symmetric(
          //   horizontal: kDefaultPadding,
          // ),
          height: 250,
          width: size.width,
          child: FadeInImage.assetNetwork(
            placeholder: PlaceHolder,
            image: widget.data['image'],
            fit: BoxFit.cover,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
          top: kDefaultPadding * 1.2,
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              widget.data['Description'],
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 19, fontFamily: "Lato"),
            ),
          ),
        ),
      ]),
    );
  }
}
