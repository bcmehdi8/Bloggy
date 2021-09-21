// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelv2/backend/bloc/article_bloc.dart';
import 'package:travelv2/backend/bloc/category_bloc.dart';
import 'package:travelv2/backend/events/article_events.dart';
import 'package:travelv2/backend/events/category_events.dart';
import 'dart:math' as math;

import 'components/Home/body.dart'; // import this

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ArticleBloc bloc;
  late CategoryBloc categoryBloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ArticleBloc>(context);
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    bloc.add(FetchArticleList());
    categoryBloc.add(FetchCategoryList());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

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
