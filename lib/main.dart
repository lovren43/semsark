import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:semsark/models/response/user_details.dart';
import 'package:semsark/provider/advertisement_detailes_provider.dart';
import 'package:semsark/provider/chat_provider.dart';
//import 'package:semsark/provider/chat_provider.dart';
import 'package:semsark/provider/create_ad_provider.dart';
import 'package:semsark/provider/filter_provider.dart';
//import 'package:provider/provider.dart';
//import 'package:semsark/provider/login_provider.dart';
import 'package:semsark/provider/home_provider.dart';
import 'package:semsark/provider/login_provider.dart';
import 'package:semsark/provider/profile_provider.dart';
import 'package:semsark/provider/sign_up_provider.dart';
import 'package:semsark/provider/verify_user_provider.dart';
import 'package:semsark/screens/advertisementDetails/advertisement_details_screen.dart';
import 'package:semsark/screens/auth/personal_info_screen.dart';
import 'package:semsark/screens/auth/sign_in_screen.dart';
import 'package:semsark/screens/home/chat_screen.dart';
import 'package:semsark/screens/home/chat_screen.dart';
import 'package:semsark/screens/home/create_advertisement_screen.dart';
import 'package:semsark/screens/home/filter_screen.dart';
import 'package:semsark/screens/home/home_screen.dart';
import 'package:semsark/screens/home/profile_screen.dart';
import 'package:semsark/screens/splash/splash_screen.dart';

import 'screens/home/verify_user_screen.dart';

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
        ChangeNotifierProvider(create: (create) => ProfileProvider()),
        ChangeNotifierProvider(create: (create) => CreateAdvertisementProvider()),
        ChangeNotifierProvider(create: (create) => FilterProvider()),
        ChangeNotifierProvider(create: (create) => ChatProvider()),
        ChangeNotifierProvider(create: (create) => SignUpProvider()),
        ChangeNotifierProvider(create: (create) => AdvertisementDetailsProvider()),
        ChangeNotifierProvider(create: (create) => VerifyUserProvider(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()),
    );
  }
}
