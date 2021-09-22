import 'dart:convert';

import 'package:travelv2/backend/model/article_model.dart';
import 'package:travelv2/config/constants.dart';
import 'package:http/http.dart' as http;

class ArticleRepository {
  Future<List<Article>> getArticleListRepo() async {
    final String pathUrl = "$PROTOCOL://$DOMAIN/getUser";
    var response = await http.get(Uri.parse(pathUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw "NOOOOOO";
    }
  }
  Future<List<Article>> getWriterPopularPosts(int writerID) async {
    final String pathUrl = "$PROTOCOL://$DOMAIN/getWriterPopularPosts?writerID=$writerID";
    var response = await http.get(Uri.parse(pathUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw "NOOOOOO";
    }
  }
}
