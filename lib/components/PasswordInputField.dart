import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class PassordInputField extends StatefulWidget {
  PassordInputField(this.hintText, {super.key});
  String? hintText;

  @override
  State<PassordInputField> createState() => _PassordInputFieldState();
}

class _PassordInputFieldState extends State<PassordInputField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      focusNode: textFieldFocusNode,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF1F6FB),
        prefixIcon: const Icon(Icons.lock_outlined),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xFF8189B0)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
