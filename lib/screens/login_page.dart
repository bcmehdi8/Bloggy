// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/components/Login/background.dart';
import 'package:travelv2/screens/components/Login/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFB900),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              EvaIcons.arrowIosBack,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFFFFB900),
                height: size.height - 80,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.2,
                      decoration: BoxDecoration(color: Color(0xFFFFB900)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign In",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "We can't wait to see you enjoying time \nwith Bloggy community",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: size.height * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            //     username  TextField
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: kDefaultPadding * 2),
                                    child: RoundedInputField(
                                      userTextController: _userEmailController,
                                      hintText: "Your Email",
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  RoundedPasswordField(
                                    userPasswordController: _userPasswordController,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),

                            //Login Now Button
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 45, bottom: 10),
                              child: Center(
                                child: InkWell(
                                  child: Container(
                                    height: 59,
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Login Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            //forget password
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: kDefaultPadding / 2),
                              child: Center(
                                  child: Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Nunito Sans",
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                            //         Fb and google icons
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.08),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Colors.red,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.blue,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(
                                        FontAwesomeIcons.twitter,
                                        color: Colors.blue,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                            //sign up Text
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: kDefaultPadding),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        '/signup_page',
                                        arguments: {});
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "Don't have an account? ",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "Open Sans")),
                                    TextSpan(
                                        text: "Sign up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "Open Sans"))
                                  ])),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
