import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

class Helper {
  static Color blue = const Color(0xff4885c5);
  static Color light_blue = Colors.grey[200]!;
  static Color light_blue_or = Colors.lightBlueAccent;
  static Color grey = Colors.grey;
  static Color input_field_color = const Color(0xfff1f6fb);
  static String token = "";
  static TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white.withRed(93).withGreen(109).withBlue(129),
  );

  static TextStyle stlye = const TextStyle(color: Colors.grey);

  static getToken() async {
    var box = await Hive.openBox(MY_BOX) ;
    token = box.get("token") ?? "";
  }
  static setToken(_token) async {
    var box = await Hive.openBox(MY_BOX) ;
    box.put("token" , _token);
    token = _token ;
  }
}
