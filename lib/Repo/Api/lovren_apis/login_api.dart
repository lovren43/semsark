import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:semsark/globals.dart' as global;

import '../../../helper/Api.dart';

class LoginServices{

  Future<bool> login(String email, String password) async {
    String data =
        await Api().post(url: 'insecure/authenticate', body: jsonEncode({"email":email, "password":password, "social":true}));
    String token=data.substring(10,data.length-2);
    global.tokken = token ;
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);

    var value = await storage.read(key: 'token');
    debugPrint(value);
    return true;
  }
}