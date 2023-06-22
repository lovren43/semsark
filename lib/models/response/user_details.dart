// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

import 'advertisement_response_model.dart';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  int id;
  String username;
  String gender;
  String email;
  String password;
  String phone;
  int rate;
  int rateSum;
  int rateCounter;
  bool verifyId;
  bool verify;
  bool suspended;
  String deviceId;
  String img;
  String personalImg;
  String idImg;
  List<AdvertisementModel> myAds;
  Favourites favourites;

  UserDetails({
    required this.id,
    required this.username,
    required this.gender,
    required this.email,
    required this.password,
    required this.phone,
    required this.rate,
    required this.rateSum,
    required this.rateCounter,
    required this.verifyId,
    required this.verify,
    required this.suspended,
    required this.deviceId,
    required this.img,
    required this.personalImg,
    required this.idImg,
    required this.myAds,
    required this.favourites,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    username: json["username"],
    gender: json["gender"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    rate: json["rate"],
    rateSum: json["rateSum"],
    rateCounter: json["rateCounter"],
    verifyId: json["verifyID"],
    verify: json["verify"],
    suspended: json["suspended"],
    deviceId: json["deviceId"],
    img: json["img"],
    personalImg: json["personalImg"],
    idImg: json["idImg"],
    myAds: List<AdvertisementModel>.from(json["myAds"].map((x) => AdvertisementModel.fromJson(x))),
    favourites: Favourites.fromJson(json["favourites"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "gender": gender,
    "email": email,
    "password": password,
    "phone": phone,
    "rate": rate,
    "rateSum": rateSum,
    "rateCounter": rateCounter,
    "verifyID": verifyId,
    "verify": verify,
    "suspended": suspended,
    "deviceId": deviceId,
    "img": img,
    "personalImg": personalImg,
    "idImg": idImg,
    "myAds": List<dynamic>.from(myAds.map((x) => x.toJson())),
    "favourites": favourites.toJson(),
  };
}

class Favourites {
  int id;
  int userId;
  List<AdvertisementModel> buildings;

  Favourites({
    required this.id,
    required this.userId,
    required this.buildings,
  });

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
    id: json["id"],
    userId: json["userId"],
    buildings: List<AdvertisementModel>.from(json["buildings"].map((x) => AdvertisementModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "buildings": List<dynamic>.from(buildings.map((x) => x.toJson())),
  };
}



