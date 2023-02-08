import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputDigit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   TextField(
      maxLength: 1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        counterText: "",
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