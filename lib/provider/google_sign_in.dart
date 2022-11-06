

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/Home_screen.dart';

class GoogleSignInProvider  {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Future<User?> googleLogin() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        //  Navigator.pushReplacementNamed(
        //                 context, RoutesName.welcomeScreen);
        final userCredential = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));

        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
          code: "Error_aborder_by_user", message: "Sign In aborded by user");
    }
    return null;
  }

  Future<void> googleSignOut() async {
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
  // // object
  // final googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;
  // GoogleSignInAccount get user=> _user!;

  // Future googleLogin() async{
  //   final googleUser = await googleSignIn.signIn();
  //   if (googleUser == null) return;
  //   _user = googleUser;

  // final googleAuth = await googleUser.authentication;

  // final credential = GoogleAuthProvider.credential(
  //   accessToken: googleAuth.accessToken,
  //   idToken: googleAuth.idToken,
  // );
   

  // await FirebaseAuth.instance.signInWithCredential(credential);
  

  // notifyListeners();
  }

