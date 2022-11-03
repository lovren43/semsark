import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/button.dart';

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
              color: Color(0xFF8189B0),
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputField('Phone number', const Icon(Icons.phone_android_outlined)),
          const SizedBox(
            height: 10,
          ),
          InputField('Password', const Icon(Icons.lock_outlined)),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Forget passowrd?',
            style: TextStyle(
              color: Color(0xFFFF6A6A),
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButon(text: 'Login'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Dont't have an account?"),
              Text('      Sign Up',style: TextStyle(
                color: Color(0xFF45A6DD)
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
