// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

class commentsPage extends StatefulWidget {
  final Map data;
  const commentsPage({Key? key, required this.data}) : super(key: key);

  @override
  _commentsPageState createState() => _commentsPageState();
}

class _commentsPageState extends State<commentsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data['title'],
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: new IconButton(
          icon: new Icon(
            EvaIcons.arrowIosDownward,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Text(
              "Comments(56)",
              style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://resize.prod.femina.ladmedia.fr/rblr/652,438/img/var/2021-08/selenag.jpg"),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Anita Michaels",
                      style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 17,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "3 hrs ago",
                      style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width * 0.75,
                      child: Text(
                        "You Always give good advice, What would you say to someone",
                        softWrap: true,
                        //maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
