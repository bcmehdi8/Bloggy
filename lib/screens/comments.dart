// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travelv2/backend/bloc/comment_bloc.dart';
import 'package:travelv2/backend/events/comment_events.dart';
import 'package:travelv2/backend/states/comment_states.dart';
import 'package:travelv2/config/constants.dart';
import 'package:comment_box/comment/comment.dart';

import 'components/chat_input.dart';

class commentsPage extends StatefulWidget {
  final Map data;
  const commentsPage({Key? key, required this.data}) : super(key: key);

  @override
  _commentsPageState createState() => _commentsPageState();
}

class _commentsPageState extends State<commentsPage> {
  late CommentsBloc commentsBloc;

  @override
  void initState() {
    commentsBloc = BlocProvider.of<CommentsBloc>(context);
    commentsBloc.add(FetchCommentsList());
    commentsBloc.articleID = widget.data['articleID'];
    super.initState();
  }

  @override
  void dispose() {
    commentsBloc.close();
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
          BlocBuilder<CommentsBloc, CommentsState>(
            builder: (context, state) {
              if (state is CommentsInitialState) {
                return CircularProgressIndicator();
              } else if (state is CommentsLoadingState) {
                return CircularProgressIndicator();
              } else if (state is CommentsFetchSuccessList) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.comments.length,
                      //shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var data = state.comments[index];
                        return commentsList(
                            userImage: data.commenterImage,
                            userName: data.commenterName,
                            date: data.commentDate,
                            commentContent: data.comment,
                            likes: data.commentLike,
                            replies: data.commentReplies);
                      }),
                );
              } else if (state is CommentsErrorState) {
                return Center(
                  child: Text("ERROR BLOC"),
                );
              }
              return Text("ERROR");
            },
          ),
          Spacer(),
          ChatInputField(),
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
      height: 900,
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
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
                        Text("Like"),
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

class BottomSection extends StatefulWidget {
  BottomSection({Key? key}) : super(key: key);

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [];
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //elevation: 10,
      child: Container(
        height: 68,
        color: Colors.amber,
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }
}
