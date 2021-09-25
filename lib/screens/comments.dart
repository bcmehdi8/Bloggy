// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/backend/bloc/comment_bloc.dart';
import 'package:travelv2/backend/events/comment_events.dart';
import 'package:travelv2/backend/model/comments_model.dart';
import 'package:travelv2/backend/repo/comment_repo.dart';
import 'package:travelv2/backend/states/comment_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:comment_box/comment/comment.dart';

import 'components/Article/chat_input.dart';

class commentsPage extends StatefulWidget {
  final Map data;
  Stream? massegeStream;
  commentsPage({Key? key, required this.data}) : super(key: key);

  @override
  _commentsPageState createState() => _commentsPageState();
}

class _commentsPageState extends State<commentsPage> {
  StreamController _streamController = StreamController();
  late CommentsBloc commentsBloc;
  final commentBlocc = CommentsBlocc();
  ScrollController _scrollController = new ScrollController();
  // late Timer _timer;

  @override
  void initState() {
    commentBlocc.articleID = widget.data['articleID'];
    commentBlocc.eventSink.add(CommentAction.Fetch);
    commentBlocc.articleID = widget.data['articleID'];
    commentsBloc = BlocProvider.of<CommentsBloc>(context);
    commentsBloc.add(FetchCommentsList());
    commentsBloc.articleID = widget.data['articleID'];
    //Check the server every 5 seconds
    // _timer = Timer.periodic(Duration(seconds: 1),
    //     (timer) => commentBlocc.eventSink.add(CommentAction.Fetch));
    super.initState();
  }

  CommentsRepository _commentsRepository = new CommentsRepository();
  @override
  void dispose() {
    commentsBloc.close();
    // if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data['title'],
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: new IconButton(
          icon: new Icon(
            EvaIcons.arrowIosDownward,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: _commentsRepository
                .getCommentsListRepo(widget.data['articleID']),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return CircularProgressIndicator();
              } else if (snapshot is CommentsLoadingState) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      //shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var data = snapshot.data![index];
                        print("Future List Tocuhed");
                        
                        return commentsList(
                            userImage: data.commenterImage,
                            userName: data.commenterName,
                            date: data.commentDate,
                            commentContent: data.comment,
                            likes: data.commentLike,
                            replies: data.commentReplies);
                      }),
                );
              }
              return Text("ERROR while retrieving comment");
            },
          ),
          //Spacer(),
          ChatInputField(
            data: widget.data,
            scrollController: _scrollController,
          ),
          
        ],
      ),
    );
  }
}

class commentsList extends StatefulWidget {
  String? userImage;
  String userName, date, commentContent;

  int likes, replies;

  commentsList(
      {Key? key,
      this.userImage,
      required this.userName,
      required this.date,
      required this.commentContent,
      required this.likes,
      required this.replies})
      : super(key: key);

  @override
  _commentsListState createState() => _commentsListState();
}

class _commentsListState extends State<commentsList> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 145,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //       horizontal: kDefaultPadding, vertical: kDefaultPadding),
          //   child: Text(
          //     "Comments(56)",
          //     style: TextStyle(
          //         fontFamily: "Open Sans",
          //         fontSize: 25,
          //         fontWeight: FontWeight.w800),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.userImage.toString()),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 17,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "${widget.date}",
                      style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width * 0.75,
                      child: Text(
                        widget.commentContent,
                        softWrap: true,
                        //maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            LineIcons.heart,
                            color: Colors.red,
                          ),
                        ),
                        Text("${widget.likes} Like"),
                        SizedBox(
                          width: 40,
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(LineIcons.reply)),
                        Text("${widget.replies} Replies"),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
