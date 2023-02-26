import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:semsark/screens/joo_screens/SplashScreen.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp() ;
  runApp(const Semsark());
}

class Semsark extends StatelessWidget {
  const Semsark({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignInPage());
  }
}
