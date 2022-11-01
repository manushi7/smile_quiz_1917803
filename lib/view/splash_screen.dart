import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: 
      
        
          Container(
            decoration: BoxDecoration(
                color: new Color.fromARGB(255, 243, 135, 19),
                gradient: LinearGradient(colors: [(Color.fromARGB(255, 108, 229, 162)), Color.fromARGB(255, 11, 197, 63)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft
                )
            ),
            child: Center(
            child:  Container(
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/smileybee.png"),fit: BoxFit.cover)),
                        height: 100,
                        width: 100, 

                      ), 
          ) ,
          ),
          
        
      
    );
  }
}