import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smile_quiz/utils/constants.dart';

import 'smile_screen.dart';
import 'signup_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [(Color.fromARGB(255, 34, 236, 125)), Color.fromARGB(255, 11, 197, 63),
          ],
        ),
      ),
        child: Stack(
          children: [
            //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            SafeArea(
              /*child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Let's Play!!",
                style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                )
                Text("Enter your information below")
              ],)
              */
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2), //2/6
                    Text(
                      "Let's Play Quiz,",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text("Enter your informations below"),
                    SizedBox(height: 10,), // 1/6
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    Spacer(), // 1/6
                    InkWell(
                      onTap: () {
             
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmileScreen(),
                        )
                      );
              },
                      child: Container(
                        width: 300, height: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Lets Start Quiz",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Get {
  static to(SignUpScreen SmileScreen) {}
}