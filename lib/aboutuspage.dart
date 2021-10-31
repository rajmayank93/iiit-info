import 'package:flutter/material.dart';

class aboutuspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'About us',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(3),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    ' About Us',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Team Name : ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Column(
                    children: [
                      Text(
                        'Prajeeth (S20200020303)',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Mayank (S20200020280)',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Aalhad (S20200010001)',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
