// ignore_for_file: prefer_final_fields, prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/model/user_model.dart';
import 'package:travelv2/config/constants.dart';

class UserPrefrences {
  final storage = FlutterSecureStorage();
  Future saveUserData(UserModel userModel) async {
    await storage.write(key: 'userid', value: userModel.userid.toString());
    await storage.write(key: 'username', value: userModel.username);
    await storage.write(key: 'userimg', value: userModel.userimg);
    await storage.write(key: 'useremail', value: userModel.useremail);

    print("User Saved");
  }

  Future _loadUser(String _randomNumber) async {
    final savedUser = storage.read(key: 'username') ?? "Dear";
    return _randomNumber = savedUser.toString();
  }
}
