import 'package:flutter/material.dart';

class PassordInputField extends StatelessWidget {
  PassordInputField(this.hintText, {super.key});
  String? hintText;
  bool invisible = true;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF1F6FB),
          prefixIcon: const Icon(Icons.lock_outlined),
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

