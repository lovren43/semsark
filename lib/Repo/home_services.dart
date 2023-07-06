import 'dart:convert';
import 'dart:io';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import 'package:semsark/models/response/user_details.dart';
import '../../models/request/ad_model.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../utils/end_points.dart';
import '../utils/helper.dart';

class HomeServices {

  var headers = {
    'Access-Control-Allow-Headers':
    "DNT,X-CustomHeader,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Authorization",
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Credentials': "true",
    'content-Type': 'application/json',
    'Accept': "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };


  Future checkIsFav(id) async {
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.get(
        Uri.parse("$CHECK_IS_FAV$id"),
        headers: headers,
      );
      return response.body ;
    } catch (e) {
      return false ;
    }
  }
  Future refreshToken() async {
  headers['Authorization'] = 'Bearer $token';

  final http.Response response = await http.get(
  Uri.parse("$baseURL/token/refresh"),
  headers: headers,
  );
  return jsonDecode(response.body)["refreshToken"] ;
}
  Future addToFav(id) async
  {
    headers['Authorization'] = 'Bearer $token';

    try {
      final http.Response response = await http.post(
        Uri.parse("$ADD_TO_FAV/$id"),
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 302) {
        return Success(
          code: 200,
          response:"",
        );
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: "401");
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: FormatException);
    } catch (e) {
      return Failure(code: UNKNOWN, errorResponse: e);
    }
  }
  Future removeFromFav(id) async
  {
    headers['Authorization'] = 'Bearer $token';
    print(token);
    try {
      final http.Response response = await http.delete(
        Uri.parse("${DELETE_FROM_FAV}$id"),
        headers: headers,
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response:"",
        );
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: jsonDecode(response.body)["message"]);
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: FormatException);
    } catch (e) {
      return Failure(code: UNKNOWN, errorResponse: e);
    }
  }
  Future verifyNID(face1 , face2) async
  {
    headers['Authorization'] = 'Bearer $token';

    try {
      final http.Response response = await http.post(
          Uri.parse(VERIFY_NID),
          headers: headers,
          body: jsonEncode({
            "face1": face1,
            "face2": face2
          }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(
          code: 200,
          response:"",
        );
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: jsonDecode(response.body)["message"]);
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: FormatException);
    } catch (e) {
      return Failure(code: UNKNOWN, errorResponse: e);
    }
  }
  String token = Helper.token;
  Future createAdvertisement(CreateAdvertisementModel model) async
  {
    headers['Authorization'] = 'Bearer $token';

    try {
      final http.Response response = await http.post(
          Uri.parse(CREATE_AD),
          headers: headers,
          body: createAdvertisementModelToJson(model)
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(
          code: 200,
          response:"",
        );
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: jsonDecode(response.body)["message"]);
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: FormatException);
    } catch (e) {
      return Failure(code: UNKNOWN, errorResponse: e);
    }
  }

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
      print(e);
      return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
    }
  }

  Future getAdvertisements() async {
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
      print(e) ;
      return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
    }
  }
  Future getAdvertisementById( id ) async {
    // String token = await getToken();
    headers['Authorization'] = 'Bearer $token';
    try {
      final http.Response response = await http.get(
        Uri.parse("$GET_AD_BY_ID/$id"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Success(
          code: 200,
          response: advertisementModelFromJson(response.body),
        );
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: "Invalid Data");
    } on HttpException {
      return Failure(code: NO_INTERNE, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      print(e) ;
      return Failure(code: UNKNOWN, errorResponse: "Unknown Error");
    }
  }
}