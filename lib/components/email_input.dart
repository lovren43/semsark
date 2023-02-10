import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailInputField extends StatelessWidget {
  EmailInputField(this.hintText, this.inputIcon, {super.key});
  String? hintText;
  Icon? inputIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          EmailValidator.validate(value!) ? null : "Please enter a valid email",
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
