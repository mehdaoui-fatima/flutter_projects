import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'personalCard',
      home: MyCard(),
    );
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffa45c),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/nailla.jpeg'),
            ),
            Text(
              'Fatima-ezzahra Mehdaoui',
              style: TextStyle(
                fontSize: 30.3,

                //fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                color: Color(0xffffcdab),
                //wordSpacing: 30.0,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
                color: Color(0xff5d5d5a),
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              width: 150.0,
              child: Divider(color: Color(0xff5d5d5a)),
            ),
            Card(
              color: Color(0xffffcdab),
              margin: EdgeInsets.all(13),
              elevation: 10,
              // padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: Color(0xffffa45c),
                  size: 30.0,
                ),
                title: Text("+212-123456789"),
              ),
            ),
            Card(
              color: Color(0xffffcdab),
              margin: EdgeInsets.all(13),
              elevation: 10,
              //padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(
                  Icons.mail_outline,
                  color: Color(0xffffa45c),
                  size: 30.0,
                ),
                title: Text('example@gmail.com'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
