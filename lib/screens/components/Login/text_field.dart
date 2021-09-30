import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

class TextFieldContainer extends StatefulWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.045, vertical: size.height * 0.001),
      width: size.width * 0.9,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.3),
      //       spreadRadius: 0,
      //       blurRadius: 7,
      //       offset: Offset(1, 3), // changes position of shadow
      //     ),
      //   ],
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(40),
      // ),
      child: widget.child,
    );
  }
}

class RoundedEmailInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController userTextController;
  final Key Formkey;

  const RoundedEmailInputField({
    Key? key,
    required this.Formkey,
    required this.userTextController,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedEmailInputField> createState() => _RoundedEmailInputFieldState();
}

class _RoundedEmailInputFieldState extends State<RoundedEmailInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: widget.Formkey,
        controller: widget.userTextController,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value!.isNotEmpty || value.isValidEmail()) {
            return null;
          } else {
            return "Enter correct Email";
          }
        },
      ),
    );
  }
}

//username field
class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController userTextController;
  final Key Formkey;

  const RoundedInputField({
    Key? key,
    required this.Formkey,
    required this.userTextController,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: widget.Formkey,
        controller: widget.userTextController,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        validator: (value) {
          print("Valye is : " + value.toString());
          if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return "Enter correct name";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Key Formkey;
  const RoundedPasswordField({
    Key? key,
    required this.Formkey,
    required this.userPasswordController,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController userPasswordController;

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: widget.Formkey,
        controller: widget.userPasswordController,
        obscureText: _passwordVisible,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: kPrimaryColor,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              }),
          border: InputBorder.none,
        ),
        validator: (value) {
          print("Password Value is : " + value.toString());
          if (value!.length < 6) {
            return "Add a password of at least 6 characters";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
