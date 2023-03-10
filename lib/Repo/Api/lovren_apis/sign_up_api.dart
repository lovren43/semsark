import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:semsark/globals.dart' as global;

import '../../../helper/Api.dart';

class SignUpServices {
  Future<bool> verifyEmail(String email) async {
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
        .post(url: 'email/verifyEmail', body: jsonEncode({"otp": OTP, "email": email}));
    return true;
  }

  Future<bool> createUser(String name, String email, String img,
      String password, String gender,String phoneNumber) async {
    String data = await Api().post(url: 'insecure/userDetails', body: jsonEncode({
      "username": name,
      "email": email,
      "social": false,
      "img": img,
      "password": password,
      "gender": gender,
      "phone": phoneNumber
    }));
    String token=data.substring(10,data.length-2);
    global.tokken = token ;
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
    var value = await storage.read(key: 'token');
    return true;
  }
}
