import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor:Color(0xFFF1F6FB),
              prefixIcon: Icon(Icons.mail_outlined),
              hintText: 'Email or phone number',
              hintStyle: TextStyle(color:Color(0xFF8189B0)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
              )
            ),
          );
  }
}
