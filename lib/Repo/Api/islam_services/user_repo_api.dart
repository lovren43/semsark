import 'dart:convert';

import 'package:semsark/Repo/Api/end_point.dart';
import 'package:semsark/Repo/repo.dart';
import 'package:http/http.dart' as http;
import 'package:semsark/globals.dart' as globals;

class ApiUserRepo extends UserRepo{
  @override

  Future<Map<String , dynamic>> getUser() async{
    var response =await http.get(
      Uri.parse(ApiEndPoints.baseURL+ApiEndPoints.getUser),
      headers: globals.headers ,
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body) ;
    }
    return {} ;
  }

}