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
    return type == 1
        ? Color.fromARGB(255, r, g, b)
        : Color.fromRGBO(r, b, g, 0.8);
  }

  @override
  Widget build(BuildContext context) {
    print('buid question');
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          color: generateRandomColor()),
      child: Padding(
        padding: type == 1
            ? const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0)
            : const EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
        child: Text(
          question,
          style: TextStyle(
              fontSize: type == 1 ? 60.0 : 90.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
