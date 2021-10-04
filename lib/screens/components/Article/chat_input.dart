// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/backend/comment_bloc/comment_bloc.dart';
import 'package:travelv2/backend/comment_bloc/comment_events.dart';
import 'package:travelv2/backend/comment_bloc/comment_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/comments_page.dart';

class ChatInputField extends StatefulWidget {
  final Map data;
  ScrollController scrollController;
  

  ChatInputField({Key? key, required this.data, required this.scrollController})
      : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  
  TextEditingController commentController = TextEditingController();
  late CommentsBloc commentsBloc;
  final commentBlocc = CommentsBlocc();
  late Timer _timer;

  @override
  void initState() {
    commentsBloc = BlocProvider.of<CommentsBloc>(context);
    commentBlocc.articleID = widget.data['articleID'];

    super.initState();
  }

  @override
  void dispose() {
    commentsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: "Type comment",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        createCommentButton();
                      },
                      icon: Icon(
                        LineIcons.paperPlane,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future createCommentButton() async {
    commentsBloc.articleID = widget.data['articleID'];
    commentsBloc.userID = 1;
    commentsBloc.commentContent = commentController.text;
    commentsBloc.add(AddComment());
    print("button pressed");
    commentBlocc.eventSink.add(CommentAction.Fetch);
    FocusScope.of(context).unfocus();
    _timer = Timer(Duration(seconds: 1), () {
      setState(() {
        widget.scrollController.animateTo(
          widget.scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      });
    });
    commentController.text = "";
  }
}
