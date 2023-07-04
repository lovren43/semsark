import 'dart:convert';
import 'dart:io';

import 'package:semsark/Repo/remote/remote_status.dart';

import '../models/response/user_details.dart';
import '../utils/constants.dart';
import '../utils/end_points.dart';
import 'package:http/http.dart' as http;

import '../utils/helper.dart';


class ProfileServices {
  var headers = {
    'Access-Control-Allow-Headers':
    "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Credentials': "true",
    'content-Type': 'application/json',
    'Accept': "application/json",
  };

  String token = Helper.token;

  Future getUser() async {
    String url = '$GET_USER';
    headers['Authorization'] = 'Bearer $token';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return Success(code: 200, response: userDetailsFromJson(response.body));
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

  Future editUser(user) async {
    String url = '$UPDATE_USER';
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.patch(Uri.parse(url),
          headers: headers, body: profileToJson(user));
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: userDetailsFromJson(response.body),
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
