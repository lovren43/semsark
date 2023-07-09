import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/provider/create_ad_provider.dart';
import 'package:semsark/provider/filter_provider.dart';
import 'package:semsark/provider/home_provider.dart';
import 'package:semsark/provider/profile_provider.dart';
import 'package:semsark/screens/auth/sign_in_screen.dart';
import 'package:semsark/utils/helper.dart';

import '../../provider/chat_provider.dart';
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
    Future.delayed(const Duration(seconds: 3) , () async {
      // get Token
      await Helper.getToken() ;
      String token = Helper.token;
      if(token!=""){
        String token = await HomeServices().refreshToken() as String;
        await Helper.setToken(token) ;
        await HomeServices().createFakeAds();
        await Provider.of<HomeProvider>(context , listen: false).init();
        await Provider.of<ProfileProvider>(context, listen: false).init();
        //await Provider.of<ChatProvider>(context, listen: false).init();
        await Provider.of<CreateAdvertisementProvider>(context, listen: false).init();
        //await Provider.of<FilterProvider>(context).init();
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:
              (context) => HomeScreen()
          )) ;
        });
      }
      else {
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:
              (context) => LoginScreen()
          )) ;
        });
      }
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
