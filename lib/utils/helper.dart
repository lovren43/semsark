import 'dart:ui';
import 'package:flutter/material.dart';

class Helper {
  static Color blue = Color(0xff4885c5);
  static Color light_blue = Colors.grey[200]!;
  //static Color light_blue = Color(0xff9ad6f5);
  static Color grey = Colors.grey;
  static Color input_field_color = Color(0xfff1f6fb);
  static String token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpc2xhbW1hYm91b3VmQGdtYWlsLmNvbSIsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJleHAiOjE2OTAzODYyOTEsImlhdCI6MTY4ODU4NjI5MX0.kvwEeZNAMnC9TXLhptfofERSPPCg2ygV7hcIAsh0gnXYSINUHixX_1aMCDl47RhTzJFDdbGvjUdq49qWH8ngww";
  static TextStyle textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white.withRed(93).withGreen(109).withBlue(129),
  );

  static TextStyle stlye = TextStyle(color: Colors.grey);
}
