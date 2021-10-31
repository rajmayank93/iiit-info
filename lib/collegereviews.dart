import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class collegeratings extends StatefulWidget {
  @override
  static var collegename;
  State<collegeratings> createState() => _loginpageState();
}

void collegeratingsinfo(var college_name, BuildContext context) {
  collegeratings.collegename = college_name;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => collegeratings(),
      ));
}

class _loginpageState extends State<collegeratings> {
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
        body: Userinfo());
  }
}

class Userinfo extends StatefulWidget {
  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final Stream<QuerySnapshot> _collegesstream = FirebaseFirestore.instance
      .collection(collegeratings.collegename)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _collegesstream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Something went wrong',
                    style: TextStyle(color: Colors.white)));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(
                  data['Title'],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                subtitle: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        data['Email'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data['Body'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        });
  }
}
