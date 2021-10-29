import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/drawers/loginmaindrawer.dart';
import 'package:hackathon/main.dart';

class afterloginmainpage extends StatefulWidget {
  @override
  State<afterloginmainpage> createState() => _loginpageState();
}

class _loginpageState extends State<afterloginmainpage> {
  String? emailid = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'IIIT info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: loginmaindrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$emailid',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
