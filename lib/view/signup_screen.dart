import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {

  final formKey = GlobalKey<FormState>();

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController cpasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(90), bottomLeft: Radius.circular(90)),
                    color: new Color.fromARGB(255, 243, 135, 19),
                    gradient: LinearGradient(colors: [(Color.fromARGB(255, 34, 236, 125)), Color.fromARGB(255, 11, 197, 63)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                                "Register",
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
                      controller: nameController,
                      cursorColor: Color.fromARGB(255, 11, 197, 63),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 11, 197, 63),
                        ),
                        hintText: "Full Name",
                        
                       /* autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && EmailValidator.validate(email)
                                    ? null
                                    : "Enter a valid email", */
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (name) =>
                                name != null 
                                    ? null
                                    : "Enter a full name",
                    ),
                  ),
            
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      cursorColor: Color.fromARGB(255, 11, 197, 63),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 11, 197, 63),
                        ),
                        hintText: "Email",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && EmailValidator.validate(email)
                                    ? null
                                    : "Enter a valid email",
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
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Color.fromARGB(255, 11, 197, 63),
                      decoration: InputDecoration(
                        focusColor: Color.fromARGB(255, 11, 197, 63),
                        icon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 11, 197, 63),
                        ),
                        hintText: "Phone Number",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (number) =>
                                number != null && number.length<10
                                    ? "Enter a valid phone number"
                                    : null,
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
                    child: TextFormField(
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length<6
                                    ? "Enter minimum six characters"
                                    : null,
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
                    child: TextFormField(
                      controller: cpasswordController,
                      cursorColor: Color.fromARGB(255, 11, 197, 63),
                      decoration: InputDecoration(
                        focusColor: Color.fromARGB(255, 11, 197, 63),
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color.fromARGB(255, 11, 197, 63),
                        ),
                        hintText: "Confirm Password",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value1) =>
                                value1 == passwordController ?"Password doesn't match"
                                :null
                                    
                    ),
                  ),
            
                  GestureDetector(
                    onTap:register,
                     //() {
                      // Write Click Listener Code Here.
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ) 
                        ); */
                    //},
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
                        "REGISTER",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have Already Member?  "),
                        GestureDetector(
                          child: Text(
                            "Login Now",
                            style: TextStyle(
                                color: Color.fromARGB(255, 11, 197, 63)
                            ),
                          ),
                          onTap: () {
                            // Write Tap Code Here.
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
   Future register() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
     if (passwordController.text == cpasswordController.text) {
       try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
             email: emailController.text.trim(),
             password: passwordController.text.trim());
        log(emailController.text,name: "email controller value");    
        log(passwordController.text,name: "pasw controller value");    

        
        Fluttertoast.showToast(
        msg: "Registered Successfully",  // message
                 // duration
    );

         await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          )
                        );
       } on FirebaseAuthException catch (e) {
         //Utils.flushBarErrorMessage(e.message!, context);
       print(e);
    }
     } else {
      print("Password doesn't match");
       //Utils.flushBarErrorMessage("Password doesn't match", context);
     }
   }
}