import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/drawers/loginmaindrawer.dart';
import 'package:hackathon/main.dart';

class afterloginapp extends StatelessWidget {
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
            nextScreen: afterloginmainpage()),
      ),
    );
  }
}

class afterloginmainpage extends StatefulWidget {
  @override
  State<afterloginmainpage> createState() => _loginpageState();
}

class _loginpageState extends State<afterloginmainpage> {
  String emailid = FirebaseAuth.instance.currentUser?.email ?? '';

  final List<String> college = <String>[
    'IIIT HYDERABAD',
    'IIIT BANGLORE',
    'IIIT GUWAHATI',
    'IIIT JABALPUR',
    'IIIT Gwalior',
    'IIIT Allahabad',
    'IIITDM kanchipuram'
  ];

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
        drawer: loginmaindrawer(context),
        body: ListView.builder(
          itemBuilder: (BuildContext, index) {
            return Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.book_outlined,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (college[index]),
                    // onPressed: () {
                    //   // do something
                    // },
                  ),
                ),
              ),
            );
          },
          itemCount: college.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(4),
          scrollDirection: Axis.vertical,
        ));
  }
}
