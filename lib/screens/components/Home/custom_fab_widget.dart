// ignore_for_file: prefer_const_constructors

import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/screens/comments.dart';

const double fabSize = 56;

class CustomFABWidget extends StatelessWidget {
  final ContainerTransitionType? transitionType;
  final Map data;

  const CustomFABWidget({
    Key? key,
    this.transitionType,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OpenContainer(
        transitionDuration: Duration(milliseconds: 300),
        openBuilder: (context, _) => commentsPage(
          data: data,
        ),
        closedShape: CircleBorder(),
        closedColor: Colors.white,
        closedBuilder: (context, openContainer) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          height: fabSize,
          width: fabSize,
          child: Icon(LineIcons.commentDots, color: Colors.white),
        ),
      );
}
