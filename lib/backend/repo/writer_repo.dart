import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:travelv2/backend/model/writer_model.dart';
import 'package:travelv2/config/constants.dart';

class WriterRepository{
  Future<Writer> getWriterID(int writerID) async {

  var dataStr = jsonEncode(writerID);
  final String pathUrl = "$PROTOCOL://$DOMAIN/getWriter?writerID=$writerID";
  var response = await http.get(Uri.parse(pathUrl));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body); 
    Writer userData = Writer.fromJson(parsed);
    return userData;
  } else {
    throw Exception('Failed to load writer Details');
  }
}
}