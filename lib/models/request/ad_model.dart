class CreateAdModel {
  List<String> photosList;

  CreateAdModel(
      this.photosList,
      this.signalPower,
      this.title,
      this.category,
      this.apartmentDetails,
      this.price,
      this.lang,
      this.lat,
      this.area,
      this.numOfRoom,
      this.numOfBathroom,
      this.numOfHalls,
      this.level,
      this.finished,
      this.single,
      this.types);

  String signalPower;
  String title;
  String category;
  String apartmentDetails;
  String  price;
  String  lang;
  String  lat;
  String  area;
  String  numOfRoom;
  String  numOfBathroom;
  String  numOfHalls;
  String  level;
  bool finished;
  bool single;
  String types;

  Map toJSON(){
    return {
      "photosList":photosList,
      "signalPower": signalPower,
      "title": title,
      "category": category,
      "address": "string",
      "apartmentDetails": apartmentDetails,
      "city": "string",
      "gov": "string",
      "price": price,
      "lang":lang,
      "lat": lat,
      "area": area,
      "numOfRoom": numOfRoom,
      "numOfBathroom": numOfBathroom,
      "numOfHalls": numOfHalls,
      "level": level,
      "finished": finished,
      "single": single,
      "types": types
    };
  }
}
