import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semsark/components/EmailField.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          const Text(
            'PLEASE ENTER YOUR ACCOUN HERE',
            style: TextStyle(
              color:Color(0xFF8189B0),
              fontSize: 15,
            ),
          ),
          EmailField(),
        ],
      ),
    );
  }
}
