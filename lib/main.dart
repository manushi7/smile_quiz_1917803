// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smile_quiz/provider/google_sign_in.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:smile_quiz/view/Home_screen.dart';
import 'package:smile_quiz/view/splash_screen.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //final prefs = await SharedPreferences.getInstance();
  //final isloggedin = prefs.getBool('isLoggedIn') ?? false;
  //runApp(MyApp(isloggedin: isloggedin));
  await Firebase.initializeApp();
  runApp(MyApp());
}
 

class MyApp extends StatelessWidget {

  //final bool isloggedin;
  //const MyApp({Key key, this.isloggedin}) : super(key: key);
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: SplashScreen(),
  //     //main: isloggedin ? HomeScreen() : const LogIn()
  //   );
  // }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    //main: isloggedin ? HomeScreen() : const LogIn()
  );
  }
