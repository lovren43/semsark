import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/utils/helper.dart';

import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  LocationServices locationServices = LocationServices() ;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4) , () async {

      // Position position = await locationServices.getCurrentPosition(context);
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:
            (context) => HomeScreen())) ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Helper.blue,
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
