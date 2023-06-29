import 'dart:convert';
import 'dart:io';

import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/chat/chat_message_model.dart';
import 'package:semsark/models/chat/chat_user_model.dart';

import '../utils/constants.dart';
import '../utils/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatServices {
  var headers = {
    'Access-Control-Allow-Headers':
        "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Credentials': "true",
    'content-Type': 'application/json',
    'Accept': "application/json",
  };
  String token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJra0BnbWFpbC5jb20iLCJyb2xlcyI6WyJST0xFX1VTRVIiXSwiZXhwIjoxNjg5NTI5ODE1LCJpYXQiOjE2ODc3Mjk4MTV9.SEqu-giWifdrv7Ag1VgDF5tMfGgWHKa48g5ulQ5dxwO0dauUlaWjhLRaCeBbZpkccFQsIZTSERah1erm8405Aw";

  Future getChatUser() async {
    String url = '$GET_CHAT_USER';
    headers['Authorization'] = 'Bearer $token';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      print(response.toString());
      if (response.statusCode == 200) {
        return Success(code: 200, response: ChatUsersFromJson(response.body));
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: "Invalid Data");
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
    }
  }

  // Future getReciverEmail(){
  //    String url = '$VERFIY_EMAIL/$email';
  //   print(email);
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse(url),
  //         headers: headers,
  //     );
  //     print(response.toString());
  //     if (response.statusCode == 200) {
  //       return Success(
  //         code: 200,
  //         response: "",
  //       );
  //     }
  //     return Failure(code: INVALID_RESPONSE, errorResponse: "Invalid Data");
  //   } on HttpException {
  //     return Failure(code: NO_INTERNE, errorResponse: "No Internet");
  //   } on FormatException {
  //     return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
  //   } catch (e) {
  //     return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
  //   }
  // }
  Future getChatRoom(email) async {
    String url = '$GET_CHAT_ROOM/$email';
    headers['Authorization'] = 'Bearer $token';

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      print(response.toString());
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: response.body,
        );
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: "Invalid Data");
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
    }
  }

  Future<List<dynamic>> getChatMessage(room) async {
    var returnArr = [];

    final database = FirebaseDatabase.instance.reference().child('chat/');

    database.child('$room/').onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic>? dataMap =
            snapshot.value as Map<dynamic, dynamic>?;
        if (dataMap != null) {
          dataMap.forEach((key, value) {
            returnArr.add(value);
          });
        }
      }
    });
    print(returnArr);
    return returnArr;
  }

  Future sendChatMessage(message) async {
    String url = '$SEND_MESSAGE';
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: headers, body: ChatMessageToJson(message));
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: "",
        );
      }
      return Failure(
          code: INVALID_RESPONSE,
          errorResponse: jsonDecode(response.body)["message"]);
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      print(e);
      return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
    }
  }
}
