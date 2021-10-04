// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:travelv2/backend/model/user_model.dart';
import 'package:travelv2/config/constants.dart';
import 'package:travelv2/config/local_storage.dart';

class AuthRepository {
  static String mainUrl = "https://reqres.in";
  var loginUrl = '$PROTOCOL://$DOMAIN/auth/login';
  var signupUrl = '$PROTOCOL://$DOMAIN/auth/createUser';

  final _userPrefrences = UserPrefrences();

  late Map<String, dynamic> payloads;

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
    return value;
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
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
    print(response.data["message"]);
    if (response.data["message"] == "DONE") {
      payloads = Jwt.parseJwt(response.data["token"]);
      UserModel _userModel = UserModel.fromJson(payloads);
      _userPrefrences.saveUserData(_userModel);
      // await storage.write(key: 'data', value: payloads);
      // await storage.write(key: 'token', value: response.data["token"]);
      // await storage.write(key: 'userid', value: payloads['userID']);
      // await storage.write(key: 'userimg', value: payloads['userImage']);
      // await storage.write(key: 'username', value: payloads['userName']);
      // await storage.write(key: 'email', value: email);

      return response.data;
    } else {
      return response.data;
    }
  }

  Future Singup(String username, String email, String password) async {
    Response response = await _dio.post(signupUrl, data: {
      "username": username,
      "email": email,
      "password": password,
    });
    // return response.data;
    if (response.data["message"] == "NEW") {
      await storage.write(key: 'userid', value: response.data["userid"]);
      await storage.write(key: 'username', value: response.data["username"]);
      await storage.write(key: 'email', value: email);
      await storage.write(key: 'token', value: response.data["token"]);
      return response.data;
    } else {
      return response.data;
    }
    //return response.data;
  }

/////////////////////////////////////////NEW/////////////

//   Future<UserModel?> get getUser async {
//     try {
//       UserModel userModel = await _getUserData();
//       if (userModel == null) {
//         return null;
//       }
//       return userModel;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

  //getUser
  _getUserData() async {
    var value = storage.read(key: CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value.toString()));
  }

// setUser
  setUser(UserModel userModel) async {
    await storage.write(
        key: CACHED_USER_DATA, value: jsonEncode(userModel.toJson()));
  }
}
