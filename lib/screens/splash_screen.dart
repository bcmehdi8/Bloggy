import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/login_bloc/login_bloc.dart';
import 'package:travelv2/screens/login_page.dart';

import 'home_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  late LoginBloc loginBloc;
  UserRepository userRepository = UserRepository();
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      if (userRepository.hasToken() = true) {
        // user not logged ==> Login Screen
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
      } else {
        // user already logged in ==> Home Screen
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Home()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height,
      child: const Center(
          child: Text(
        "SplashScreen",
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
