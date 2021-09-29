// ignore_for_file: prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelv2/backend/article_bloc/article_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/category_bloc/category_bloc.dart';
import 'package:travelv2/backend/article_bloc/article_events.dart';
import 'package:travelv2/backend/category_bloc/category_events.dart';
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
      appBar: appBarHolder(context),
      body: Body(),
    );
  }
}

AppBar appBarHolder(BuildContext context) {
  final UserRepository userRepository = new UserRepository();
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
      IconButton(
        icon: Icon(
          EvaIcons.logOutOutline,
          color: Colors.black,
        ),
        onPressed: () async{
          final bool hasToken = await userRepository.hasToken();
          if (hasToken) {
            await userRepository.deleteToken();
            Navigator.of(context).pushReplacementNamed('/login_page', arguments: {});
          } else {
            print("couldn't logout right now");
          }
        },
      ),
    ],
  );
}
