import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:semsark/globals.dart' as global;

import '../end_point.dart';

class UserApi{

  Future<Map<String , dynamic>> getUser() async {
    var uri = Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.getUser);
    var response = await http.get(uri ,        headers: {
      'Access-Control-Allow-Headers':
      "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
      'Access-Control-Allow-Origin': "*",
      'Access-Control-Allow-Credentials': "true",
      'content-Type': 'application/json',
      'Accept': "application/json",
      'Authorization': "Bearer ${global.tokken}",
    },
    ) ;

    return jsonDecode(response.body);
  }

}