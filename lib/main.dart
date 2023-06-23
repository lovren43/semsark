import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/create_ad_provider.dart';
import 'package:semsark/provider/filter_provider.dart';
//import 'package:provider/provider.dart';
//import 'package:semsark/provider/login_provider.dart';
import 'package:semsark/provider/home_provider.dart';
import 'package:semsark/provider/login_provider.dart';
import 'package:semsark/screens/auth/sign_in_screen.dart';
import 'package:semsark/screens/home/filter_screen.dart';
import 'package:semsark/screens/home/home_screen.dart';
import 'package:semsark/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Hive.initFlutter();
  // Hive.registerAdapter(LocalAdvertisementAdapter());
  runApp(const Semsark());
}

class Semsark extends StatelessWidget {
  const Semsark({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => LoginProvider()),
        ChangeNotifierProvider(create: (create) => HomeProvider()),
        ChangeNotifierProvider(create: (create) => CreateAdvertisementProvider()),
        ChangeNotifierProvider(create: (create) => FilterProvider()),
      ],
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
