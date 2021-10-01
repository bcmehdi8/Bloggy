import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travelv2/config/constants.dart';

class UserRepository {
  static String mainUrl = "https://reqres.in";
  var loginUrl = '$PROTOCOL://$DOMAIN/auth/login';
  var signupUrl = '$PROTOCOL://$DOMAIN/auth/createUser';

  static final storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      print("hasToken() Function is TRUE and it's value is : " + value);
      return true;
    } else {
      print("hasToken() Function is FALSE");
      return false;
    }
  }

  static Future<String?> getUserame() async {
    var value = await storage.read(key: 'username') ?? 'Dear';
    print(storage.readAll());
    return value;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
    print("persistToken Function in proccess");
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
    print("Token Deleted");
  }

  Future login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });
     print("USERNAME : " + response.data["username"]);
    if (response.data["message"] == "DONE") {
      await storage.write(key: 'username', value: response.data["username"]);
      await storage.write(key: 'email', value: email);
      await storage.write(key: 'token', value: response.data["token"]);
    
      return response.data;
    } else {
      await storage.write(key: 'username', value: "Dear");
      return response.data;
    }

    // return response.data;
  }

  Future Singup(String username, String email, String password) async {
    Response response = await _dio.post(signupUrl, data: {
      "username": username,
      "email": email,
      "password": password,
    });
    // return response.data;
    if (response.data["message"] == "NEW") {
      await storage.write(key: 'username', value: response.data["username"]);
      await storage.write(key: 'email', value: response.data["email"]);
      await storage.write(key: 'token', value: response.data["token"]);
      return response.data;
    } else {
      return response.data;
    }
    //return response.data;
  }
}
