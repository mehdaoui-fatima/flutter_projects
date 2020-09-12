import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xylophone',
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber, double height}) {
    return (Expanded(
      child: Container(
        height: height,
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(soundNumber);
          },
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Xylophone"),
        ),
        body: SafeArea(
          child: Row(
            children: <Widget>[
              buildKey(color: Color(0xff574b90), soundNumber: 1, height: 500),
              buildKey(color: Color(0xff9e579d), soundNumber: 2, height: 450),
              buildKey(color: Color(0xfffc5185), soundNumber: 3, height: 400),
              buildKey(color: Color(0xff43dde6), soundNumber: 4, height: 350),
              buildKey(color: Color(0xfffaee1c), soundNumber: 5, height: 300),
              buildKey(color: Color(0xff17b978), soundNumber: 6, height: 250),
              //buildKey(color: Color(0xff1e2a78), soundNumber: 2),
              //buildKey(color: Color(0xffa7ff83), soundNumber: 7),
            ],
          ),
        ));
  }
}
