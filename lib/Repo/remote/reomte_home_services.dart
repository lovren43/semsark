import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';

import '../../models/request/ad_model.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

class RemoteHomeServices extends HomeServices{

  var headers = {
    'Access-Control-Allow-Headers':
    "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Credentials': "true",
    'content-Type': 'application/json',
    'Accept': "application/json",
  };

  Future<void> postAd(CreateAdModel model) async
  {
    var uri = Uri.parse(baseURL + CREATE_AD);
    try {
      var response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(model.toJSON()),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getToken() async {
    var box =await Hive.openBox('myBox');
    return box.get('token');
  }
  @override
  Future<Map<String , dynamic>> getUser() async{
    var response =await http.get(
      Uri.parse(baseURL+GET_USER),
      headers: headers ,
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body) ;
    }
    return {} ;
  }

  @override
  Future getAdvertisements() async {

    String url = '$baseURL/';
    String token = await getToken();
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.get(
          Uri.parse(url),
          headers: headers,
      );
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: jsonDecode(response.body)['token'],
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