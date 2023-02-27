import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:semsark/Api/end_point.dart';
import 'package:semsark/models/ad_model.dart';
import 'package:semsark/globals.dart' as global;

class CreateAdServices {
  String token = global.tokken ;
  Future<void> postAd(CreateAdModel model) async {
    var uri = Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.createAd);
    try {
      var response = await http.post(
        uri,
        headers: {
          'Access-Control-Allow-Headers':
              "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
          'Access-Control-Allow-Origin': "*",
          'Access-Control-Allow-Credentials': "true",
          'content-Type': 'application/json',
          'Accept': "application/json",
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(model.toJSON()),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
