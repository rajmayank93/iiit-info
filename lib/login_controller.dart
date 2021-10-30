import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackathon/googleloginmain.dart';
import 'package:hackathon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  login(BuildContext context) async {
    googleAccount.value = await _googleSignIn.signIn().then((value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('gmail', _googleSignIn.currentUser?.email ?? '');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => afterlogingmail(),
          ));
    });
  }

  logout(BuildContext context) async {
    googleAccount.value = await _googleSignIn.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginpage(),
        ));
  }
}
