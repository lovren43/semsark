import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:semsark/screens/islam_screens/chat.dart';
import 'package:semsark/screens/islam_screens/map_screen.dart';
import 'package:semsark/screens/islam_screens/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool isHome = true;
  int index = 0;

  var widgets = [
    Home(),
    ChatScreen(res: 'Chat Screen'),
    ChatScreen(res : 'Add Screen'),
    ChatScreen(res :"Notifications screen"),
    ChatScreen(res :"Profile Screen")
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
        child: widgets[index],
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
