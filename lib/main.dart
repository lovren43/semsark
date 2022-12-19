import 'package:flutter/material.dart';
import 'package:semsark/screens/islam_screens/HomeScreen.dart';
import 'package:semsark/screens/islam_screens/create_ad_screen.dart';
import 'package:semsark/screens/islam_screens/helper.dart';
import 'package:semsark/screens/joo_screens/SplashScreen.dart';

void main() {
  runApp(const Semsark());
}

class Semsark extends StatelessWidget {
  const Semsark({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
