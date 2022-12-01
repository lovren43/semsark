import 'package:flutter/material.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';

void main() {
  runApp(const Semsark());
}

class Semsark extends StatelessWidget {
  const Semsark({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage()
    );
  }
}
