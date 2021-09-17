import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/repos/article_model.dart';

enum ArticleAction { Fetch, Delete }

class NewsBloc {
  final _stateStreamController = StreamController<List<Article>>();
  StreamSink<List<Article>> get _articleSink => _stateStreamController.sink;
  Stream<List<Article>> get articleStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<ArticleAction>();
  StreamSink<ArticleAction> get eventSink => _eventStreamController.sink;
  Stream<ArticleAction> get _eventStream => _eventStreamController.stream;

  NewsBloc() {
    _eventStream.listen((event) async {
      if (event == ArticleAction.Fetch) {
        try {
          var news = await getNews();
          _articleSink.add(news);
        } on Exception catch (e) {
          _articleSink.addError("Something went wrong");
        }
      }
    });
  }
}

Future<List<Article>> getNews() async {
  final Dio dio = Dio();
  const PROTOCOL = "http";
  const DOMAIN = "10.0.2.2:3000";
  var newsModel;

  final String pathUrl = "$PROTOCOL://$DOMAIN/getUser";
  var response = await http.get(Uri.parse(pathUrl));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    //     var jsonString = response.body;
    // var jsonMap = json.decode(jsonString);

    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;

    //newsModel = NewsModel.fromJson(jsonMap);
  } else {
    throw "NOOOOOO";
  }

  // return newsModel;
}
