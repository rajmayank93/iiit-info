import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackathon/aboutuspage.dart';
import 'package:hackathon/afterloginpage.dart';
import 'package:hackathon/contactuspage.dart';
import 'package:hackathon/drawers/logindrawer.dart';
import 'package:hackathon/drawers/maindrawer.dart';
import 'package:hackathon/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splash: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "IIIT's Info",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                  ),
                ),
              ],
            )),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.grey.shade900,
            nextScreen: loginpage()),
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return loginpagetest(context);
  }

  Scaffold loginpagetest(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Obx(() {
          if (controller.googleAccount.value == null) {
            return maindrawer(context);
          } else {
            return logindrawer(context);
          }
        }),
        body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Obx(() {
                if (controller.googleAccount.value == null) {
                  return loginpagebutton();
                } else {
                  return buildafterlogin();
                }
              }),
            )));
  }

  Column loginpagebutton() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {},
            label: Text('Sign Up'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              controller.login();
            },
            icon: Icon(
              FontAwesomeIcons.google,
            ),
            label: Text('Sign In With Google'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          TextButton(onPressed: () {}, child: Text('Have an account? login'))
        ]);
  }
}
