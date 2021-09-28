import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travelv2/config/constants.dart';

class UserRepository {
  static String mainUrl = "https://reqres.in";
  var loginUrl = '$PROTOCOL://$DOMAIN/auth/login';
  var signupUrl = '$PROTOCOL://$DOMAIN/auth/createUser';

  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });
    // return response.data["token"];
    return response.data;
  }
    Future<String> Singup(String username,String email, String password) async {
    Response response = await _dio.post(signupUrl, data: {
      "username": username,
      "email": email,
      "password": password,
    });
    // return response.data["token"];
    return response.data;
  }
}
