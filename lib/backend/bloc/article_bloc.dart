import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/backend/events/article_events.dart';
import 'package:travelv2/backend/model/article_model.dart';
import 'package:travelv2/backend/repo/article_repo.dart';
import 'package:travelv2/backend/states/article_states.dart';
import 'package:travelv2/config/constants.dart';

class ArticleBloc extends Bloc<ArticleEvents, ArticleState> {
  int writerID = 0;
  ArticleRepository _repository;
  ArticleBloc(ArticleState initialState, this._repository)
      : super(initialState);

  @override
  Stream<ArticleState> mapEventToState(ArticleEvents event) async* {
    if (event is FetchArticleList) {
      yield ArticleLoadingState();
      try {
        var article = await _repository.getArticleListRepo();
        yield FetchSuccessList(article: article);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    } else if (event is FetchPopularWriterArticles) {
      try {
        var article = await _repository.getWriterPopularPosts(writerID);
        yield FetchSuccessList(article: article);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
