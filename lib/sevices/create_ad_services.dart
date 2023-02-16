import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:semsark/Api/end_point.dart';
import 'package:semsark/ad_model.dart';

class CreateAdServices {
  String token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpc2xhbUBpc2xhbS5jb20iLCJyb2xlcyI6WyJST0xFX1VTRVIiXSwiZXhwIjoxNjc4MzE1MTc4LCJpYXQiOjE2NzY1MTUxNzh9.RYUN5yn-BCUX_PCMwOoPB0z6HP1wE1o3x6LZLVxgLZ6uXaPWxL6r9LSU4cZnPSQVbNoMIi0lErd0WtCDysqaAQ";
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
