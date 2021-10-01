// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/config/constants.dart';

class HeaderTextSearchBox extends StatefulWidget {
  const HeaderTextSearchBox({Key? key, required this.size}) : super(key: key);

  final Size size;
  @override
  _HeaderTextSearchBoxState createState() => _HeaderTextSearchBoxState();
}

class _HeaderTextSearchBoxState extends State<HeaderTextSearchBox> {
  UserRepository userRepository = new UserRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.28,
          width: size.width,
          // color: Colors.amber,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, Mehdi!",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito Sans'),
                      ),
                      Text(
                        "Discover Latest \nNews",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          //fontFamily: 'Nunito Sans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: size.height * 0.075,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 5),
                                blurRadius: 3,
                                color: kPrimaryColor.withOpacity(0.2))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    color: kTextColor.withOpacity(0.5)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: kPrimaryColor,
                            ),
                            padding: EdgeInsets.only(left: size.width * 0.1),
                            iconSize: 28.0,
                          )
                        ],
                      )))
            ],
          ),
        )
      ],
    );
  }
}
