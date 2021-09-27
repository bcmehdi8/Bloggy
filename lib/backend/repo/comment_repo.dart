import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:travelv2/backend/model/comments_model.dart';
import 'package:travelv2/config/constants.dart';
import 'package:http/http.dart' as http;

final Dio dio = Dio();

class CommentsRepository {
  //Fetch Article's comments
  Future<List<Comments>> getCommentsListRepo(int articleID) async {
    final String pathUrl =
        "$PROTOCOL://$DOMAIN/getComments?articleID=$articleID";
    var response = await http.get(Uri.parse(pathUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Comments> comments =
          body.map((dynamic item) => Comments.fromJson(item)).toList();
      print("Comment ADDED!");
     // print(comments);
      return comments;
    } else {
      throw "comments Not FOUND";
    }
  }

  //Post a comment
  Future postComment(int ArticleID, int UserID, String Content) async {
    final String pathUrl = "$PROTOCOL://$DOMAIN/postComment";
    String articleID = jsonEncode(ArticleID);
    String userID = jsonEncode(UserID);
    String commentContent = jsonEncode(Content);

    var response = await dio.post(pathUrl,
        data: {
          'articleID': articleID,
          'userID': userID,
          'commentContent': Content
        },
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw "comment can't be inserted";
    }
  }
}
