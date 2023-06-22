// To parse this JSON data, do
//
//     final advertisementModel = advertisementModelFromJson(jsonString);

import 'dart:convert';

List<AdvertisementModel> allAdvertisementFromJson(String str) => List<AdvertisementModel>.from(json.decode(str).map((x) => AdvertisementModel.fromJson(x)));
AdvertisementModel advertisementFromJson(String str) => AdvertisementModel.fromJson(json.decode(str));

String advertisementModelToJson(List<AdvertisementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertisementModel {
  int id;
  int userId;
  List<PhotosList> photosList;
  String signalPower;
  String title;
  String category;
  String dailyPrice;
  String address;
  String des;
  String apartmentDetails;
  String city;
  String gov;
  String types;
  double price;
  int views;
  DateTime date;
  double? lng;
  double? lat;
  int area;
  int numOfRoom;
  int numOfBathroom;
  int numOfHalls;
  int level;
  bool finished;
  bool single;
  bool acceptBusiness;
  bool elevator;

  AdvertisementModel({
    required this.id,
    required this.userId,
    required this.photosList,
    required this.signalPower,
    required this.title,
    required this.category,
    required this.dailyPrice,
    required this.address,
    required this.des,
    required this.apartmentDetails,
    required this.city,
    required this.gov,
    required this.types,
    required this.price,
    required this.views,
    required this.date,
    this.lng,
    this.lat,
    required this.area,
    required this.numOfRoom,
    required this.numOfBathroom,
    required this.numOfHalls,
    required this.level,
    required this.finished,
    required this.single,
    required this.acceptBusiness,
    required this.elevator,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    id: json["id"],
    userId: json["userId"],
    photosList: List<PhotosList>.from(json["photosList"].map((x) => PhotosList.fromJson(x))),
    signalPower: json["signalPower"],
    title: json["title"],
    category: json["category"],
    dailyPrice: json["dailyPrice"],
    address: json["address"],
    des: json["des"],
    apartmentDetails: json["apartmentDetails"],
    city: json["city"],
    gov: json["gov"],
    types: json["types"],
    price: json["price"],
    views: json["views"],
    date: DateTime.parse(json["date"]),
    lng: json["lng"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
    area: json["area"],
    numOfRoom: json["numOfRoom"],
    numOfBathroom: json["numOfBathroom"],
    numOfHalls: json["numOfHalls"],
    level: json["level"],
    finished: json["finished"],
    single: json["single"],
    acceptBusiness: json["acceptBusiness"],
    elevator: json["elevator"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "photosList": List<dynamic>.from(photosList.map((x) => x.toJson())),
    "signalPower": signalPower,
    "title": title,
    "category": category,
    "dailyPrice": dailyPrice,
    "address": address,
    "des": des,
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
    "acceptBusiness": acceptBusiness,
    "elevator": elevator,
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
