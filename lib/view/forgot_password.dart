import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';

class ForgotScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<ForgotScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }


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
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(120)),
                color: new Color.fromARGB(255, 243, 135, 19),
                 gradient: LinearGradient(colors: [(Color.fromARGB(255, 34, 236, 125)), Color.fromARGB(255, 11, 197, 63)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset(
                          "assets/smileybee.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Reset Password",
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
              child: TextFormField(
                controller: emailController,
                cursorColor: Color.fromARGB(255, 13, 120, 104),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 13, 120, 104),
                  ),
                 
                  //hintText: "Enter Valid Email",
                  //enabledBorder: InputBorder.none,
                  //focusedBorder: InputBorder.none,
                ),
                 validator: (email) => 
                    email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    :null
              ),
            ),

            GestureDetector(
              onTap: resetPassword,
              // () {
              //   // Write Click Listener Code Here.
              //   Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => LoginScreen(),
              //           ));
              // },
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
                  "Reset Password",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            
          ],
        )
      )
    );
    
  }
  Future resetPassword() async{
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),);
    try{
    await FirebaseAuth.instance
      .sendPasswordResetEmail(email: emailController.text.trim());
     Fluttertoast.showToast(
        msg: "Password Reset Email Sent",  // message
                 // duration

    );
       Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
              
   
    } on FirebaseAuthException catch (e) {
      print(e);

      
    }

  }
}