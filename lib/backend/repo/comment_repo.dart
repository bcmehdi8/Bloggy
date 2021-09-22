import 'dart:convert';
import 'dart:developer';
import 'package:travelv2/backend/model/comments_model.dart';
import 'package:travelv2/config/constants.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<List<Comments>> getCommentsListRepo(int articleID) async {
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
