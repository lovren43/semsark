import 'package:flutter/material.dart';
import 'package:semsark/screens/islam_screens/HomeScreen.dart';
import 'package:semsark/screens/islam_screens/create_ad_screen.dart';
import 'package:semsark/screens/islam_screens/helper.dart';
import 'package:semsark/screens/joo_screens/SplashScreen.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';

void main() {
  runApp(const Semsark());
}

class Semsark extends StatelessWidget {
  const Semsark({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignInPage());
  }
}
