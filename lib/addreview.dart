import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackathon/afterloginmainpage.dart';
import 'package:hackathon/collegeinfo.dart';
import 'package:hackathon/drawers/logindrawer.dart';
import 'package:hackathon/forgotpassword.dart';
import 'package:hackathon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addratingspage extends StatefulWidget {
  @override
  State<addratingspage> createState() => _loginpageState();
}

class _loginpageState extends State<addratingspage> {
  final titleController = TextEditingController();
  final reviewController = TextEditingController();
  @override
  var email = FirebaseAuth.instance.currentUser?.email ??
      controller.googleAccount.value?.email ??
      '';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Review',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Add review',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: titleController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please add review';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Title',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: TextField(
                  minLines: 1,
                  maxLines: 8,
                  style: TextStyle(color: Colors.white),
                  controller: reviewController,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Review (Optional)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection(collegeinfopage.college_id)
                            .doc(email)
                            .set({
                          "Email": email,
                          "Title": titleController.text,
                          "Body": reviewController.text,
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Add review',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
