import 'dart:math';
import 'package:flutter/material.dart';

//for math game and word game
//TODO: ADD SHADOW TO TEXT
class QuestionWidget extends StatelessWidget {
  QuestionWidget({this.question, this.type});

  final int type; //1 = word, 2 = math
  final String question;

  Color generateRandomColor() {
    var ran = Random();
    int r = ran.nextInt(256);
    int g = ran.nextInt(256);
    int b = ran.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    print('buid question');
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          border:
              type == 2 ? Border.all(color: Colors.black, width: 2.0) : null,
          color: generateRandomColor()),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
        child: Text(
          question,
          style: TextStyle(
              fontSize: type == 1 ? 60.0 : 75.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
