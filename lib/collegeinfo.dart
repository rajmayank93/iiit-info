import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/drawers/loginmaindrawer.dart';
import 'package:hackathon/main.dart';

class collegeinfopage extends StatefulWidget {
  @override
  static var collegename;
  State<collegeinfopage> createState() => _loginpageState();
}

void collegeinfo(var college_name, BuildContext context) {
  collegeinfopage.collegename = college_name;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => collegeinfopage(),
      ));
}

class _loginpageState extends State<collegeinfopage> {
  final Stream collegedata = FirebaseFirestore.instance
      .collection('College_List')
      .doc(collegeinfopage.collegename)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'IIIT info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: Text(
        collegeinfopage.collegename,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
