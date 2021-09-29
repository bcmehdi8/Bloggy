import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/auth_bloc/auth_state.dart';
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
  late AuthenticationBloc authenticationBloc;
  UserRepository userRepository = UserRepository();

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  void _navigateAndDisplaySelection(BuildContext context, String router) async {
    final result =
        await Navigator.of(context).pushNamed('/$router', arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            print("Authenticated");
            return _navigateAndDisplaySelection(context, "home");
          }
          if (state is AuthenticationUnauthenticated) {
            print("Unauthenticated");
            return _navigateAndDisplaySelection(context, "login_page");
          }
        },
        child: Container(
          color: Colors.white,
          height: size.height,
          child: const Center(
              child: Text(
            "SplashScreen",
            style: TextStyle(color: Colors.black),
          )),
        ),
      ),
    );
  }
}
