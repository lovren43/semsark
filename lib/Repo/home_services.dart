import 'dart:io';

import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import 'package:semsark/models/response/user_details.dart';

import '../../models/request/ad_model.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

import '../../utils/end_points.dart';

class HomeServices {

  var headers = {
    'Access-Control-Allow-Headers':
    "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Credentials': "true",
    'content-Type': 'application/json',
    'Accept': "application/json",
  };

  String token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJlc0Blcy5jb20iLCJyb2xlcyI6WyJST0xFX1VTRVIiXSwiZXhwIjoxNjg5MjQ2NTI4LCJpYXQiOjE2ODc0NDY1Mjh9._Bzg1j7vSXPvY9QA6cVpRhAHTcDCBZSmaZSGtbn0-ypnL3lrUEgjuN7YaKFYpBAf9a0-m4IrdaC-1NehnAoKHA";


  Future createAdvertisement(CreateAdvertisementModel model) async
  {
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.post(
          Uri.parse(GET_USER),
          headers: headers,
          body: createAdvertisementModelToJson(model)
      );
      print(response.body);
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: createAdvertisementModelFromJson(response.body),
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

  // Future<String> getToken() async {
  //   var box =await Hive.openBox('myBox');
  //   return box.get('token');
  // }
  @override
  Future getUser() async {
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.get(
        Uri.parse(GET_USER),
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: userDetailsFromJson(response.body),
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

  @override
  Future getAdvertisements() async {
    // String token = await getToken();
    // headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.get(
        Uri.parse(GET_ALL_ADS),
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: allAdvertisementFromJson(response.body),
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

  @override
  Future getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

}