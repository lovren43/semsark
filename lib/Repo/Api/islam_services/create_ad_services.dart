import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:semsark/models/ad_model.dart';
import 'package:semsark/globals.dart' as global;

import '../end_point.dart';

class CreateAdServices {
  
  Future<void> postAd(CreateAdModel model) async {
    var uri = Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.createAd);
    try {
      var response = await http.post(
        uri,
        headers: global.headers,
        body: jsonEncode(model.toJSON()),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
