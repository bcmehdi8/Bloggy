// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelv2/config/constants.dart';

class writerPage extends StatefulWidget {
  final Map writerInfo;
  writerPage({Key? key, required this.writerInfo}) : super(key: key);

  @override
  State<writerPage> createState() => _writerPageState();
}

class _writerPageState extends State<writerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.23,
              width: size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.5),
              color: Colors.black12,
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      backgroundImage: NetworkImage(
                         widget.writerInfo['writerImage']),
                      child: Text(
                        "",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      widget.writerInfo['writerName'],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          fontFamily: "NunitoSans"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Top Author",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              fontFamily: "NunitoSans"),
                        ),
                        Image.network(
                          "https://freepikpsd.com/media/2019/10/star-vector-png-5-Transparent-Images.png",
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
