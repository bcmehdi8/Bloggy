// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Color(0xFFFFB900),
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.3,
                decoration: BoxDecoration(color: Color(0xFFFFB900)),
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
                                  top: kDefaultPadding * 4),
                              child: RoundedInputField(
                                hintText: "Your Email",
                                onChanged: (value) {},
                              ),
                            ),
                            RoundedPasswordField(
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),

                      //Login Now Button
                      Padding(
                        padding: const EdgeInsets.only(top: 45, bottom: 10),
                        child: Center(
                          child: InkWell(
                            child: Container(
                              height: 55,
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  "Login Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                      //forget password
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Center(
                            child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Nunito Sans",
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

// Background(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(kDefaultPadding),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Welcome Back!",
//                     style: TextStyle(
//                         fontSize: 35,
//                         fontFamily: "Inter",
//                         fontWeight: FontWeight.w400),
//                   ),
//                   // ignore: prefer_const_constructors
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: kDefaultPadding),
//                     child: Text(
//                       "Sign in to continue",
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: "Inter"),
//                     ),
//                   ),
//                   //username TextField
//                   Center(
//                     child: Column(
//                       children: [
//                         Padding(
                          
//                           padding:
//                               const EdgeInsets.only(top: kDefaultPadding * 4),
//                           child: RoundedInputField(
//                             hintText: "Your Email",
//                             onChanged: (value) {},
//                           ),
//                         ),
//                         RoundedPasswordField(
//                           onChanged: (value) {},
//                         ),
//                       ],
//                     ),
//                   ),

//                   //Login Now Button
//                   Padding(
//                     padding: const EdgeInsets.only(top: 45, bottom: 10),
//                     child: Center(
//                       child: InkWell(
//                         child: Container(
//                           height: 55,
//                           width: size.width * 0.7,
//                           decoration: BoxDecoration(
//                             color: kPrimaryColor,
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Login Now",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 20),
//                             ),
//                           ),
//                         ),
//                         onTap: () {},
//                       ),
//                     ),
//                   ),
//                   //forget password
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//                     child: Center(
//                         child: Text(
//                       "Forgot Password ?",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontFamily: "Nunito Sans",
//                           fontWeight: FontWeight.w600),
//                     )),
//                   ),
//                   //Fb and google icons
//                   Padding(
//                     padding: EdgeInsets.only(top: size.height * 0.08),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: FaIcon(
//                               FontAwesomeIcons.google,
//                               color: Colors.red,
//                               size: 30,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: FaIcon(
//                               FontAwesomeIcons.facebook,
//                               color: Colors.blue,
//                               size: 30,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: FaIcon(
//                               FontAwesomeIcons.twitter,
//                               color: Colors.blue,
//                               size: 30,
//                             )),
//                       ],
//                     ),
//                   ),
//                   //sing up Text
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
//                     child: Center(
//                       child: RichText(
//                           text: TextSpan(children: [
//                         TextSpan(
//                             text: "Don't have an account? ",
//                             style: TextStyle(
//                                 color: Colors.black87,
//                                 fontFamily: "Open Sans")),
//                         TextSpan(
//                             text: "Sign up",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w800,
//                                 fontFamily: "Open Sans"))
//                       ])),
//                     ),
//                   )
//                 ]),
//           ),
//         ),
//       ),