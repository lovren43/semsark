// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());
Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class UserDetails {

  int id;
  String username;
  String gender;
  String email;
  String password;
  String phone;
  double rate;
  double rateSum;
  int rateCounter;
  Profile profile;
  bool verifyId;
  bool verify;
  bool suspended;
  String ?deviceId;
  String ?img;
  String ?personalImg;
  String ?idImg;
  Favourites ?favourites;

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
    required this.profile,
    required this.verifyId,
    required this.verify,
    required this.suspended,
    required this.deviceId,
    required this.img,
    required this.personalImg,
    required this.idImg,
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
    profile: Profile.fromJson(json["profile"]),
    verifyId: json["verifyID"],
    verify: json["verify"],
    suspended: json["suspended"],
    deviceId: json["deviceId"],
    img: json["img"],
    personalImg: json["personalImg"],
    idImg: json["idImg"],
    favourites:json["favourites"]==null?null: Favourites?.fromJson(json["favourites"]),
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
    "profile": profile.toJson(),
    "verifyID": verifyId,
    "verify": verify,
    "suspended": suspended,
    "deviceId": deviceId,
    "img": img,
    "personalImg": personalImg,
    "idImg": idImg,
    "favourites": favourites?.toJson(),
  };
}

class Favourites {
  int id;
  int userId;
  List<Building> buildings;

  Favourites({
    required this.id,
    required this.userId,
    required this.buildings,
  });

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
    id: json["id"],
    userId: json["userId"],
    buildings: List<Building>.from(json["buildings"].map((x) => Building.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "buildings": List<dynamic>.from(buildings.map((x) => x.toJson())),
  };
}

class Building {
  int id;
  int userId;
  String signalPower;
  String title;
  String category;
  String dailyPrice;
  String apartmentDetails;
  String city;
  String gov;
  String types;
  int price;
  int views;
  DateTime date;
  int lng;
  int lat;
  int area;
  int numOfRoom;
  int numOfBathroom;
  int numOfHalls;
  int level;
  bool finished;
  bool single;
  bool acceptBusiness;
  bool elevator;
  String user;

  Building({
    required this.id,
    required this.userId,
    required this.signalPower,
    required this.title,
    required this.category,
    required this.dailyPrice,
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
    required this.acceptBusiness,
    required this.elevator,
    required this.user,
  });

  factory Building.fromJson(Map<String, dynamic> json) => Building(
    id: json["id"],
    userId: json["userId"],
    signalPower: json["signalPower"],
    title: json["title"],
    category: json["category"],
    dailyPrice: json["dailyPrice"],
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
    acceptBusiness: json["acceptBusiness"],
    elevator: json["elevator"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "signalPower": signalPower,
    "title": title,
    "category": category,
    "dailyPrice": dailyPrice,
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
    "user": user,
  };
}

class Profile {
  int id;
  String name;
  List<Role> roles;

  Profile({
    required this.id,
    required this.name,
    required this.roles,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  int id;
  String name;

  Role({
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
