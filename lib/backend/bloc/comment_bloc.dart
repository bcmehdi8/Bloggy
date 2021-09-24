// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/backend/events/comment_events.dart';
import 'package:travelv2/backend/model/comments_model.dart';
import 'package:travelv2/backend/repo/comment_repo.dart';
import 'package:travelv2/backend/states/comment_states.dart';
import 'package:travelv2/config/constants.dart';

enum CommentAction { Fetch, Delete }

class CommentsBlocc {
  int articleID = 0;
  final _stateStreamController = StreamController<List<Comments>>();
  StreamSink<List<Comments>> get _commentSink => _stateStreamController.sink;
  Stream<List<Comments>> get commentStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CommentAction>();
  StreamSink<CommentAction> get eventSink => _eventStreamController.sink;
  Stream<CommentAction> get _eventStream => _eventStreamController.stream;

  CommentsBlocc() {
    _eventStream.listen((event) async {
      if (event == CommentAction.Fetch) {
        var comment = await getComments(articleID);
        _commentSink.add(comment);
      }
    });
  }
  Future<List<Comments>> getComments(int articleID) async {
    final String pathUrl =
        "$PROTOCOL://$DOMAIN/getComments?articleID=$articleID";
    var response = await http.get(Uri.parse(pathUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Comments> comments =
          body.map((dynamic item) => Comments.fromJson(item)).toList();
      return comments;
    } else {
      throw "comments Not FOUND";
    }
  }
}

class CommentsBloc extends Bloc<CommentsEvents, CommentsState> {
  CommentsRepository _repository;
  final commentBlocc = CommentsBlocc();
  int articleID = 0, userID = 0;
  String commentContent = "";
  CommentsBloc(CommentsState initialState, this._repository)
      : super(initialState);

  @override
  Stream<CommentsState> mapEventToState(CommentsEvents event) async* {
    //Get List of comments
    if (event is FetchCommentsList) {
      yield CommentsLoadingState();
      try {
        var comments = await _repository.getCommentsListRepo(articleID);
        yield CommentsFetchSuccessList(comments: comments);
      } catch (e) {
        print(e.toString());
        yield CommentsErrorState(message: e.toString());
      }
    }
//Add Comment
    if (event is AddComment) {
      yield CommentsLoadingState();
      try {
        _repository.postComment(articleID, userID, commentContent);
        // var comments = await _repository.getCommentsListRepo(articleID);
        // yield CommentsFetchSuccessList(comments: comments);
  
        commentBlocc.eventSink.add(CommentAction.Fetch);
        yield CommentAddedState();
      } catch (e) {
        print(e.toString());
        yield CommentsErrorState(message: e.toString());
      }
    }
  }
}
