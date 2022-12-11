import 'dart:async';

import 'package:flutter/material.dart';
import 'package:semsark/screens/islam_screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(69, 166, 221, 1),
            child: Column(children: [
              Expanded(
                  child: Center(
                    child: Image.asset(
                        'assets/images/Animation.gif' ,
                      height: 800 ,
                      width: double.infinity,
                    ),
              )),
              const Text('WITH YOU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontFamily: 'Hacen',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 20,
                  )),
              const SizedBox(height: 100),
            ])));
  }
}
