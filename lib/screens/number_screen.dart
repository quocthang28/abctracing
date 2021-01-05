import 'package:flutter/material.dart';
import 'package:text_reg/components/canvas.dart';

class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  void checkAnswer(String answer) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              QuestionWidget(''),
              Canvas(checkAnswer: checkAnswer),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  //maybe video, image...
  QuestionWidget(this.question);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}
