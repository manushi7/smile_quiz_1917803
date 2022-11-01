import 'dart:developer';
import 'Home_screen.dart';

import 'forgot_password.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void createAccount() async{
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();

  //   if(email == "" || password == ""){
  //     log("please fill all the details");
  //   }
  //   else if(password != Password){
  //     log("please fill orrect details");
  //   }
  //   else{
  //     /*try{
  //       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email,
  //       password: Password);
  //       if(userCredential.user != null){
  //         Navigator.pop(context);
  //       }
  //       //log("user created!");
  //     } on FirebaseAuthException catch(ex) {

  //       log(ex.code.toString());

  //     } */
      
        

  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
                color: Color.fromARGB(255, 243, 135, 19),
                gradient: LinearGradient(colors: [(Color.fromARGB(255, 34, 236, 125)), Color.fromARGB(255, 11, 197, 63)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     /* Container(
                        // margin: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets\smile_emoji.png",
                          height: 205,
                          width: 205 ,
                        ),
                      ),
                      */
                      Container(
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/smileybee.png"),fit: BoxFit.cover)),
                        height: 100,
                        width: 100, 

                      ), 
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),

              Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                controller: emailController,
                cursorColor: Color.fromARGB(255, 11, 197, 63),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 11, 197, 63),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)
                  ),
                ],
              ),
              child: TextField(
                controller: passwordController,
                cursorColor: Color.fromARGB(255, 11, 197, 63),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(255, 11, 197, 63),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color.fromARGB(255, 11, 197, 63),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotScreen(),
                        )
                      );
                    },
                  // Write Click Listener Code Here
                
                child: Text("Forget Password?"),
              ),
                
            ),

            GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )
                      );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(Color.fromARGB(255, 34, 236, 125)), Color.fromARGB(255, 11, 197, 63)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?  "),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 197, 63)
                      ),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        )
                      );
                    },
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}