import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:semsark/screens/home/chat_screen.dart';
import 'package:semsark/screens/home/create_advertisement_screen.dart';
import 'package:semsark/utils/helper.dart';

import '../auth/sign_in_screen.dart';
import 'map_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {

  late Position currentPosition;

  HomeScreen({super.key , required this.currentPosition});
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool isHome = true;
  int index = 0;

  var widgets = [
    ChatScreen(res: 'Chat Screen'),
    CreateAd(),
    NotificationScreen(),
    LoginScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        child: index==0 ? Home(cameraPosition: widget.currentPosition,) :widgets[index-1],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        height: 75,
        items: const [
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.chat_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_box_outlined,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (_index) {
          setState(() {
            index = _index;
          });
        },
        color: Helper.blue,
      ),
    );
  }
}
