import 'package:flutter/material.dart';
import './quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quizApp',
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Icon choice;
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool pickedAnswer) {
    if (quizBrain.isFinished() == true) {
      Alert(
        context: context,
        title: "Stupid kido!",
        desc: " You\'ve reached the end of the quiz.try again ",
      ).show();
      quizBrain.reset();
      scoreKeeper = [];
    } else {
      bool correctAnswer = quizBrain.getAnswer();
      if (correctAnswer == pickedAnswer) {
        choice = Icon(
          Icons.check,
          color: Colors.green,
        );
      } else {
        choice = Icon(
          Icons.close,
          color: Colors.red,
        );
      }
      setState(() {
        quizBrain.nextQuestion();
        scoreKeeper.add(choice);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff364f6b),
      appBar: AppBar(
        title: Text(
          "Quizler",
          style: TextStyle(
            color: Color(0xfffc5185),
          ),
        ),
        backgroundColor: Color(0xff364f6b),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              //flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  color: Color(0xfffc5185),
                  child: Text(
                    "False",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              //flex: 0,

              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  color: Color(0xfffc5185),
                  child: Text(
                    "True",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 10),
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}
