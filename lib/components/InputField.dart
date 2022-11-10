import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(this.hintText, this.inputIcon);
  String? hintText;
  Icon? inputIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF1F6FB),
          prefixIcon: inputIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF8189B0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}
