import 'package:flutter/material.dart';

class inputDigit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
            color: Color(0xFF8189B0),
          )),
          border: const OutlineInputBorder(
            
              borderSide: BorderSide(
            color: Color(0xFF8189B0),
          ))),
    );
  }
}