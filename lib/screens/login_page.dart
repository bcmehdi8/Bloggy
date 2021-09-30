// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelv2/backend/login_bloc/login_bloc.dart';
import 'package:travelv2/backend/login_bloc/login_state.dart';
import 'package:travelv2/backend/login_bloc/login_event.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/components/Login/background.dart';
import 'package:travelv2/screens/components/Login/text_field.dart';

import 'components/Login/bottom_question.dart';
import 'components/Login/fb_google_icons.dart';
import 'components/Login/top_message_ui.dart';
import 'components/Login/forget_password.dart';

class JosKeys {
  static final josKeys1 = GlobalKey<FormState>();
  static final josKeys2 = GlobalKey<FormState>();
  static final josKeys3 = GlobalKey<FormState>();
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  late LoginBloc authBloc;
  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible;
  @override
  void initState() {
    authBloc = BlocProvider.of<LoginBloc>(context);
    _passwordVisible = true;
    super.initState();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result =
        await Navigator.of(context).pushNamed('/home', arguments: {});
  }

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
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              return _navigateAndDisplaySelection(context);
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xFFFFB900),
                  height: size.height - 80,
                  child: Stack(
                    children: [
                      signInMessage(context),
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
                              Form(
                                key: _formKey,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: kDefaultPadding * 2),
                                        child: TextFieldContainer(
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.done,
                                            controller: _userEmailController,
                                            cursorColor: kPrimaryColor,
                                            decoration: InputDecoration(
                                              filled: true,
                                              prefixIcon: Icon(
                                                EvaIcons.person,
                                                color: kPrimaryColor,
                                              ),
                                              hintText: "example@example.com",
                                              labelText: "Email",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none,
                                                ),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  !value.isValidEmail()) {
                                                return "Enter correct Email";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      TextFieldContainer(
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          controller: _userPasswordController,
                                          obscureText: _passwordVisible,
                                          cursorColor: kPrimaryColor,
                                          decoration: InputDecoration(
                                            filled: true,
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: kPrimaryColor,
                                            ),
                                            hintText: "secure Key",
                                            labelText: "Password",
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: kPrimaryColor,
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    _passwordVisible =
                                                        !_passwordVisible;
                                                  });
                                                }),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.length < 6) {
                                              return "You need password of 6 characters";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Login Now Button
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    bottom: size.height * 0.02),
                                child: Center(
                                  child: GestureDetector(
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
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                    
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                      } else {
                                      
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('FAILED')),
                                        );
                                      }
                                      // authBloc.add(
                                      //   LoginButtonPressed(
                                      //       email: _userEmailController.text,
                                      //       password:
                                      //           _userPasswordController.text),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                              // submitButton(
                              //     context,
                              //     "Login Now",
                              //     authBloc.add(LoginButtonPressed(
                              //         email: _userEmailController.text,
                              //         password: _userPasswordController.text))),
                              //forget password
                              ForgetPassword(context),
                              //         Fb and google icons
                              fbGoogleIcons(context),
                              //sign up Text
                              RegisterQuestion(context),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
