// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'components/Article/article_body.dart';

class articlePage extends StatefulWidget {
  const articlePage({Key? key}) : super(key: key);

  @override
  _articlePageState createState() => _articlePageState();
}

class _articlePageState extends State<articlePage> {
  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                color: kPrimaryColor,
              ),
              padding: EdgeInsets.only(right: 1),
              //iconSize: 28.0,

              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ArticleBody(),
    );
  }
}
