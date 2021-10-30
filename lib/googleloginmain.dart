import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/afterloginpage.dart';
import 'package:hackathon/drawers/logindrawer.dart';
import 'package:hackathon/drawers/loginmaindrawer.dart';
import 'package:hackathon/login_controller.dart';
import 'package:hackathon/main.dart';

class afterlogingmailapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splash: Center(
                child: Text(
              "IIIT's Info",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            )),
            duration: 3000,
            splashTransition: SplashTransition.decoratedBoxTransition,
            backgroundColor: Colors.grey.shade900,
            nextScreen: afterlogingmail()),
      ),
    );
  }
}

final controller = Get.put(LoginController());

class afterlogingmail extends StatefulWidget {
  @override
  State<afterlogingmail> createState() => _loginpageState();
}

class _loginpageState extends State<afterlogingmail> {
  String emailid = FirebaseAuth.instance.currentUser?.email ?? '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            'IIIT info',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: logindrawer(context),
        body: buildafterlogin(controller));
  }
}
