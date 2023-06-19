import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< Updated upstream
import 'package:hive_flutter/hive_flutter.dart';
import 'package:semsark/adapters/local_ad_adapter.dart';
import 'package:semsark/screens/splash_screen.dart';
=======
import 'package:semsark/screens/joo_screens/Profile.dart';
import 'package:semsark/screens/joo_screens/SplashScreen.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';
>>>>>>> Stashed changes

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalAdvertisementAdapter());
  runApp(const Semsark());
}

class Semsark extends StatelessWidget {
  const Semsark({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen()
    );
  }
}
