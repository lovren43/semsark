import 'dart:convert';

import 'package:semsark/Repo/home_services.dart';

import '../../models/ad_model.dart';
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
  Future getAdvertisements() {
    // TODO: implement getAdvertisements
    throw UnimplementedError();
  }

  @override
  Future getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

}