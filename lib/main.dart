import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/pages/home_page.dart';
import 'package:getx/pages/login_page.dart';
import 'package:getx/pages/register_page.dart';

import 'Screen/Splash.dart';
import 'Screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // For Web Only: Provide FirebaseOptions manually
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAR1rUtMP0j55tbRWk7v2KjhMVZjz6Yd9w",
      projectId: "getx-4a49e",
      messagingSenderId: "763177176622",
      appId: "1:763177176622:android:1de5d10ced0ef0a5d759bf",
    ),
  );

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScree(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(name: '/SplashScreen', page: () => SplashScree()),
        GetPage(name: '/LoginScreen', page: () => LoginScreen()),
        GetPage(name: '/RegisterScreen', page: () => RegisterScreen()),
        GetPage(name: '/Home', page: () => HomePage(user: FirebaseAuth.instance.currentUser!)),

      ],
    );
  }
}