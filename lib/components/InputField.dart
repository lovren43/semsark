import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(this.hintText, this.inputIcon, {super.key});
  String? hintText;
  Icon? inputIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF1F6FB),
          prefixIcon: inputIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF8189B0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}
