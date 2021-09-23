// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/backend/bloc/comment_bloc.dart';
import 'package:travelv2/backend/events/comment_events.dart';
import 'package:travelv2/backend/states/comment_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/screens/comments.dart';

class ChatInputField extends StatefulWidget {
  final Map data;

  const ChatInputField({Key? key, required this.data}) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  TextEditingController commentController = TextEditingController();
  late CommentsBloc commentsBloc;
  final commentBlocc = CommentsBlocc();
  @override
  void initState() {
    commentsBloc = BlocProvider.of<CommentsBloc>(context);
      commentsBloc.add(FetchCommentsList());
    commentBlocc.eventSink.add(CommentAction.Fetch);
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

    BlocListener<CommentsBloc, CommentsState>(
      listener: (context, state) {
        if (state is CommentAddedState) {
          print("DONEEEEEEEEEE");
          commentsBloc.add(FetchCommentsList());
        }
      },
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if (state is CommentsInitialState) {
            return CircularProgressIndicator();
          } else if (state is CommentsLoadingState) {
            return CircularProgressIndicator();
          } else if (state is CommentAddedState) {
           commentBlocc.eventSink.add(CommentAction.Fetch);
            
          } else if (state is CommentsErrorState) {
            return Center(
              child: Text("ERROR BLOC can't be Commented"),
            );
          }
          return Text("ERROR While Commenting");
        },
      ),
    );
     commentsBloc.add(AddComment());
     commentsBloc.add(FetchCommentsList());
  }
}
