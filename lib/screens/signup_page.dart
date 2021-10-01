// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, void_checks

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelv2/backend/login_bloc/login_bloc.dart';
import 'package:travelv2/backend/login_bloc/login_event.dart';
import 'package:travelv2/backend/login_bloc/login_state.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/components/Login/background.dart';
import 'package:travelv2/screens/components/Login/text_field.dart';
import 'package:travelv2/screens/components/Login/top_message_ui.dart';

import 'components/Login/bottom_question.dart';
import 'components/Login/fb_google_icons.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  late bool _passwordVisible;

  final _formKey = GlobalKey<FormState>();
  late LoginBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<LoginBloc>(context);
    _passwordVisible = true;
    super.initState();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message,
          textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
      backgroundColor: kPrimaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result =
        await Navigator.of(context).pushReplacementNamed('/home', arguments: {});
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
            if (state is RegisterSuccess) {
              _showSnackBar(context, 'Welcome to Bloggy!');
              return _navigateAndDisplaySelection(context);
            } else if (state is AlreadyUsedEmail) {
              _showSnackBar(context, 'That email is already in use');
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
                      signUpMessage(context),
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
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.02),
                                        //Username Field
                                        child: TextFieldContainer(
                                          child: TextFormField(
                                            controller: _userNameController,
                                            cursorColor: kPrimaryColor,
                                            decoration: InputDecoration(
                                              filled: true,
                                              prefixIcon: Icon(
                                                EvaIcons.person,
                                                color: kPrimaryColor,
                                              ),
                                              hintText: "Example",
                                              labelText: "Name",
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
                                                  value.length < 2) {
                                                return "Enter a valid Name";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      //Email Field
                                      TextFieldContainer(
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.done,
                                          controller: _userEmailController,
                                          cursorColor: kPrimaryColor,
                                          decoration: InputDecoration(
                                            filled: true,
                                            prefixIcon: Icon(
                                              EvaIcons.email,
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
                                      //Password Field
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
                                            labelText: "Password",
                                            hintText: "secure Key",
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
                                    top: size.height * 0.009,
                                    bottom: size.height * 0.009),
                                child: Center(
                                  child: InkWell(
                                    child: Container(
                                      height: size.height * 0.09,
                                      // height: 59,
                                      width: size.width * 0.8,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Signup Now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        authBloc.add(RegisterButtonPressed(
                                            username: _userNameController.text,
                                            email: _userEmailController.text,
                                            password:
                                                _userPasswordController.text));
                                      } else {
                                        _showSnackBar(
                                            context, 'Failed To Register');
                                      }
                                    },
                                  ),
                                ),
                              ),

                              //         Fb and google icons
                              fbGoogleIcons(context),
                              //sign in Text
                              SigninQuestion(context),
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
