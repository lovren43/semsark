// To parse this JSON data, do
//
//     final advertisementModel = advertisementModelFromJson(jsonString);

import 'dart:convert';

import 'package:semsark/models/response/user_details.dart';

AdvertisementModel advertisementModelFromJson(String str) => AdvertisementModel.fromJson(json.decode(str));
List<AdvertisementModel> allAdvertisementFromJson(String str) => List<AdvertisementModel>.from(json.decode(str).map((x) => AdvertisementModel.fromJson(x)));

String advertisementModelToJson(List<AdvertisementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int userId;
  String username;
  String gender;
  String email;
  String phone;
  String img;
  String personalImg;
  String idImg;
  List<AdvertisementModel> myAds;
  bool verifyId;
  bool suspended;
  double rate;

  User({
    required this.userId,
    required this.username,
    required this.gender,
    required this.email,
    required this.phone,
    required this.img,
    required this.personalImg,
    required this.idImg,
    required this.myAds,
    required this.verifyId,
    required this.suspended,
    required this.rate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    username: json["username"],
    gender: json["gender"],
    email: json["email"],
    phone: json["phone"],
    img: json["img"],
    personalImg: json["personalImg"],
    idImg: json["idImg"],
    myAds: List<AdvertisementModel>.from(json["myAds"].map((x) => AdvertisementModel.fromJson(x))),
    verifyId: json["verifyID"],
    suspended: json["suspended"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "gender": gender,
    "email": email,
    "phone": phone,
    "img": img,
    "personalImg": personalImg,
    "idImg": idImg,
    "myAds": List<dynamic>.from(myAds.map((x) => x.toJson())),
    "verifyID": verifyId,
    "suspended": suspended,
    "rate": rate,
  };
}
class AdvertisementModel {
  int id;
  User? user;
  List<PhotosList> photosList;
  String signalPower;
  bool elevator;
  bool acceptBusiness;
  String dailyPrice;
  String title;
  String category;
  String apartmentDetails;
  String city;
  String gov;
  String types;
  double price;
  int views;
  DateTime date;
  double lng;
  double lat;
  int area;
  int numOfRoom;
  int numOfBathroom;
  int numOfHalls;
  int level;
  bool finished;
  bool single;
  int? userId;

  AdvertisementModel({
    required this.id,
    this.user,
    required this.photosList,
    required this.signalPower,
    required this.elevator,
    required this.acceptBusiness,
    required this.dailyPrice,
    required this.title,
    required this.category,
    required this.apartmentDetails,
    required this.city,
    required this.gov,
    required this.types,
    required this.price,
    required this.views,
    required this.date,
    required this.lng,
    required this.lat,
    required this.area,
    required this.numOfRoom,
    required this.numOfBathroom,
    required this.numOfHalls,
    required this.level,
    required this.finished,
    required this.single,
    this.userId,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    id: json["id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    photosList: List<PhotosList>.from(json["photosList"].map((x) => PhotosList.fromJson(x))),
    signalPower: json["signalPower"],
    elevator: json["elevator"],
    acceptBusiness: json["acceptBusiness"],
    dailyPrice: json["dailyPrice"],
    title: json["title"],
    category: json["category"],
    apartmentDetails: json["apartmentDetails"],
    city: json["city"],
    gov: json["gov"],
    types: json["types"],
    price: json["price"],
    views: json["views"],
    date: DateTime.parse(json["date"]),
    lng: json["lng"],
    lat: json["lat"],
    area: json["area"],
    numOfRoom: json["numOfRoom"],
    numOfBathroom: json["numOfBathroom"],
    numOfHalls: json["numOfHalls"],
    level: json["level"],
    finished: json["finished"],
    single: json["single"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "photosList": List<dynamic>.from(photosList.map((x) => x.toJson())),
    "signalPower": signalPower,
    "elevator": elevator,
    "acceptBusiness": acceptBusiness,
    "dailyPrice": dailyPrice,
    "title": title,
    "category": category,
    "apartmentDetails": apartmentDetails,
    "city": city,
    "gov": gov,
    "types": types,
    "price": price,
    "views": views,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "lng": lng,
    "lat": lat,
    "area": area,
    "numOfRoom": numOfRoom,
    "numOfBathroom": numOfBathroom,
    "numOfHalls": numOfHalls,
    "level": level,
    "finished": finished,
    "single": single,
    "userId": userId,
  };
}

class PhotosList {
  int id;
  String imgLink;

  PhotosList({
    required this.id,
    required this.imgLink,
  });

  factory PhotosList.fromJson(Map<String, dynamic> json) => PhotosList(
    id: json["id"],
    imgLink: json["imgLink"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imgLink": imgLink,
  };
}
