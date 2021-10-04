import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_event.dart';
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
  AuthRepository userRepository = AuthRepository();

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.add(appStarted());
    super.initState();
  }

  void _navigateAndDisplaySelection(BuildContext context, String screen) async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/$screen', arguments: {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //  Timer(
    //         Duration(seconds: 3),
    //             () => )
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return _navigateAndDisplaySelection(context, "home");
            //   return print("Authenticated");
          }
          if (state is AuthenticationUnauthenticated) {
            return _navigateAndDisplaySelection(context, "login_page");
            //  return print("Unauthenticated");
          }
        },
        child: Container(
          color: Colors.white,
          height: size.height,
          child: const Center(
              child: Text(
            "Bloggy is the Future",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Open sans",
                fontWeight: FontWeight.w900),
          )),
        ),
      ),
      // body: BlocListener<AuthenticationBloc, AuthenticationState>(
      //   listener: (context, state) {
      //     if (state is AuthenticationAuthenticated) {
      //       print("Authenticated");
      //       return _navigateAndDisplaySelection(context);
      //     }
      //     if (state is AuthenticationUnauthenticated) {
      //       print("Unauthenticated");
      //       return _navigateAndDisplaySelection(context);
      //     }

      //   },
      // ),
    );
  }
}
