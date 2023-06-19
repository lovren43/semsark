import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/local/create_advertisement_offline.dart';

class LocalAdvertisementAdapter extends TypeAdapter<LocalAdvertisement> {
  @override
  final typeId = 0;

  @override
  LocalAdvertisement read(BinaryReader reader) {

    String signalPower = reader.readString();
    String title = reader.readString();
    String category = reader.readString();
    String dailyPrice = reader.readString();
    String address = reader.readString();
    String des = reader.readString();
    String apartmentDetails = reader.readString();
    String city = reader.readString();
    String gov = reader.readString();
    String types = reader.readString();
    

    //
    double price = reader.readDouble();
    double lng = reader.readDouble();
    double lat = reader.readDouble();
    
    //
    int area = reader.readInt();
    int numOfRoom = reader.readInt();
    int numOfBathroom = reader.readInt();
    int numOfHalls = reader.readInt();
    int level = reader.readInt();

    // bool 
    bool finished = reader.readBool();
    bool single = reader.readBool();
    bool acceptBusiness = reader.readBool();
    bool elevator = reader.readBool();

    // list 
    final imageCount = reader.readInt();
    final images = List<File>.generate(imageCount, (_) {
      final imagePath = reader.readString();
      return File(imagePath);
    });
    return LocalAdvertisement(
        images,
         signalPower,
         title,
         category,
         dailyPrice,
         address,
         des,
         apartmentDetails,
         city,
         gov,
         types,
         price,
         lng,
         lat,
         area,
         numOfRoom,
         numOfBathroom,
         numOfHalls,
         level,
         finished,
         single,
         acceptBusiness,
         elevator);
  }

  @override
  void write(BinaryWriter writer, LocalAdvertisement obj) {
    writer.writeString(obj.signalPower);
    writer.writeString(obj.title);
    writer.writeString(obj.category);
    writer.writeString(obj.dailyPrice);
    writer.writeString(obj.address);
    writer.writeString(obj.des);
    writer.writeString(obj.apartmentDetails);
    writer.writeString(obj.city);
    writer.writeString(obj.gov);
    writer.writeString(obj.types);
    
    
    //
    writer.writeDouble(obj.price);
    writer.writeDouble(obj.lng);
    writer.writeDouble(obj.lat);
    
    // 
    writer.writeInt(obj.area);
    writer.writeInt(obj.numOfRoom);
    writer.writeInt(obj.numOfBathroom);
    writer.writeInt(obj.numOfHalls);
    writer.writeInt(obj.level);
    
    
    // bool 
    writer.writeBool(obj.finished);
    writer.writeBool(obj.single);
    writer.writeBool(obj.acceptBusiness);
    writer.writeBool(obj.elevator);
    
    // list 
    writer.writeInt(obj.photosList.length);
    for (var image in obj.photosList) {
      final imagePath = image.path;
      writer.writeString(imagePath);
    }
  }
}