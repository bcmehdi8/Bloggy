import 'dart:convert';
import 'package:travelv2/backend/model/category_model.dart';
import 'package:travelv2/config/constants.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<Category>> getCategoryListRepo() async {
    final String pathUrl = "$PROTOCOL://$DOMAIN/getCategories";
    var response = await http.get(Uri.parse(pathUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Category> category =
          body.map((dynamic item) => Category.fromJson(item)).toList();

      return category;
    } else {
      throw "Category Not FOUND";
    }
  }
}
