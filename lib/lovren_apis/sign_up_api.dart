import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart';

import '../helper/Api.dart';

class signUp {
  Future<bool> verfiyEmail(String email) async {
    dynamic data =
        await Api().get(url: 'insecure/userDetails/checkEmail/' + email);
    return true;
  }

  Future<bool> sendOTP(String email) async {
    dynamic data = await Api().post(url: 'email/sendOtp/' + email);
    return true;
  }

  Future<bool> verifyOTP(String email, String OTP) async {
    dynamic data = await Api()
        .post(url: 'email/verifyEmail', body: {"otp": OTP, "email": email});
    return true;
  }

  Future<bool> createUser(String name, String email, String img,
      String Password, String gender) async {
    dynamic data = await Api().post(url: 'insecure/userDetails', body: {
      "username": name,
      "email": email,
      "social": false,
      "img": img,
      "password": Password,
      "gender": gender
    });
    final storage = const FlutterSecureStorage();
    await storage.write(key: 'token', value: data.token);
    var value = await storage.read(key: 'token');
    print(value);
    return true;
  }
}
