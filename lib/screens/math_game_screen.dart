import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/services/math_game.dart';
import 'package:text_reg/components/canvas.dart';

class MGS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MathGame(),
      child: MathGameScreen(),
    );
  }
}

class MathGameScreen extends StatefulWidget {
  @override
  _MathGameScreenState createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  int _numberOfQuestions = 3; //TODO: implement sharedpreferences (user setting)

  @override
  Widget build(BuildContext context) {
    MathGame mathGame = Provider.of<MathGame>(context, listen: false);
    mathGame.generateMathQuestions(_numberOfQuestions);

    print('build screen');

    void checkAnswer(String answer) {
      if (mathGame.checkAnswer(answer)) {
        print('correct');
        mathGame.currentQuestionIndex++;
        mathGame.getNextQuestion();
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
                mathGame.resetGame();
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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background/game.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<MathGame>(
                builder: (context, data, child) {
                  return QuestionWidget(
                    data.currentQuestion ?? '',
                  );
                },
              ),
              SizedBox(
                height: 30.0,
              ),
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
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 84, 161, 1.0),
            border: Border.all(
              width: 4.0,
              color: Colors.white,
            ),
      ),
      child: Text(
        question,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}
