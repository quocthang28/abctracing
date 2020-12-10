import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/services/math_game.dart';
import 'package:text_reg/components/canvas.dart';

class MathGameScreen extends StatefulWidget {

  @override
  _MathGameScreenState createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  MathGame get mathGame => GetIt.I<MathGame>();
  int _numberOfQuestions =
      10; //TODO: implement sharedpreferences (user setting)

  void checkAnswer(String answer) {
    if (mathGame.checkAnswer(answer)) {
      print('correct');
      setState(() {
        mathGame.currentQuestionIndex++;
      });
    } else
      print('wrong');
    if (mathGame.isFinished()) {
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'All done!',
        buttons: [
          DialogButton(
            child: Text('Reset'),
            onPressed: () {
              setState(() {
                mathGame.resetGame();
              });
              mathGame.generateMathQuestions(_numberOfQuestions);
              Navigator.pop(context);
            },
          )
        ],
      ).show();
      //TODO: Use then() with alert dialog
      print('done');
      //show result, navigator.push to resultscreen(play again(reset game) or back to menu)
    }
  }

  @override
  void initState() {
    super.initState();
    mathGame.resetGame();
    mathGame.generateMathQuestions(_numberOfQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QuestionWidget(mathGame.getMathQuestion()),
              Canvas(checkAnswer: checkAnswer),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  //maybe video, image... (move to components folder)
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
