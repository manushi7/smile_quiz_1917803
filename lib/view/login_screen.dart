import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:smile_quiz/provider/google_sign_in.dart';


import '../controller/login_controller.dart';
import '../utils/user_details.dart';
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

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /* loginUI() {
    // loggedINUI
    // loginControllers

    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in
      if (model.userDetails != null) {
        return Center(
          
        );
      } else {
        
      }
    });
  }
*/
  // Future<void> googleSignIn() async{
  //   await GoogleSignInProvider().googleSignIn;
  //     Navigator.pushReplacement(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => HomeScreen(),
  //                         )
  //                       );

                    

  // }
  Future<void> signInWithGoogle() async {
    
    GoogleSignInProvider().googleSignIn;

    // final sp = await SharedPreferences.getInstance();
    // sp.setString(userEmail, FirebaseAuth.instance.currentUser!.email!);
    // sp.setBool(loginFlag, true);

    Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          )
                        );
     
    });
  }


  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                child: TextFormField(
                  controller: emailController,
                  cursorColor: Color.fromARGB(255, 11, 197, 63),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 11, 197, 63),
                    ),
                    
                    //hintText: "Enter Email",
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                  ),
                   validator: (email) => 
                    email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    :null
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
                onTap: login, 
                /* onTap: ()async{
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isloggedin',true);
                   Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          )
                        );

                    */
                
                  // Write Click Listener Code Here.
                  
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
              ),

                 Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: MaterialButton(
              
                    color: Colors.teal[100],
                    elevation: 10,
                    onPressed:
                    () async{ 
                      final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                      //  Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => HomeScreen(),
                      //     )
                      //   );

                      
                     },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/googleimage.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Sign In with Google")
                        
                      ],
                    ),
                  )),
              ],)
                   
                  // by onpressed we call the function signup function
                  //onPressed: ();
                    //signup(context); 
            
          ),
        )
      );
      //class LoginController with ChangeNotifier {
  // object
  
    
  }
  // var _googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? googleSignInAccount;
  // UserDetails? userDetails;

  // // fucntion for google login
  // googleLogin() async {
  //   this.googleSignInAccount = await _googleSignIn.signIn();
  //   // inserting values to our user details model

  //   this.userDetails = new UserDetails(
  //     displayName: this.googleSignInAccount!.displayName,
  //     email: this.googleSignInAccount!.email,
  //     photoURL: this.googleSignInAccount!.photoUrl,
  //   );

  //   // call
  //   notifyListeners();
  
  // }
  Future login() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
     
       try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
        log(emailController.text,name: "email controller value");    
        log(passwordController.text,name: "pasw controller value");    

        
        Fluttertoast.showToast(
        msg: "login Successful",  // message
                 // duration
    );

         await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          )
                        );
       } on FirebaseAuthException catch (e) {
         //Utils.flushBarErrorMessage(e.message!, context);
       print(e);
    }
     
  }
}

    
     
