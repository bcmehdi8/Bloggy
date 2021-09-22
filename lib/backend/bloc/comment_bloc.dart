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
import 'package:travelv2/backend/repo/comment_repo.dart';
import 'package:travelv2/backend/states/comment_states.dart';
import 'package:travelv2/config/constants.dart';

class CommentsBloc extends Bloc<CommentsEvents, CommentsState> {
  CommentsRepository _repository;
  int articleID = 0;
  CommentsBloc(CommentsState initialState, this._repository)
      : super(initialState);

  @override
  Stream<CommentsState> mapEventToState(CommentsEvents event) async* {
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
  }
}
