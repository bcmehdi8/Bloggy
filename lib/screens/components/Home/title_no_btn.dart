import 'package:flutter/material.dart';
import 'package:travelv2/config/constants.dart';

class TitleWithNoBtn extends StatelessWidget {
  const TitleWithNoBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black,
      // minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      backgroundColor: kPrimaryColor,
    );
    return Container(
      //  color: Colors.deepPurpleAccent[100],
      child: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding, bottom: kDefaultPadding / 1.1),
        child: Row(
          children: <Widget>[
            TitleWithCustomUnderline(text: title),
          ],
        ),
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                // fontFamily: 'Nunito Sans',
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
