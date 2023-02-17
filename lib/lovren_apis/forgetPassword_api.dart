import 'dart:convert';

import '../helper/Api.dart';

class forgetPassword{
  Future<bool> verifyEmail(String email) async {
    dynamic data =
        await Api().post(url: 'forgetPassword/', body: jsonEncode({"email":email}));
    return true;
  }

  Future<bool> checkOtp(String email, String OTP) async {
    dynamic data = await Api()
        .post(url: 'forgetPassword/checkOtp', body: jsonEncode({"otp": OTP, "email": email}));
    return true;
  }

  Future<bool> updatePassword(String email,String password,String OTP )async{
    dynamic data=await Api().post(url:'forgetPassword/updatePassword',body: jsonEncode({"email":email, "password":password, "otp":OTP}));
    return true;
  }
}