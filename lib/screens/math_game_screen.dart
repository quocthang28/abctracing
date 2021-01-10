import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_reg/services/math_game.dart';
import 'package:text_reg/components/canvas.dart';
import 'package:text_reg/components/question_widget.dart';

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
  int _numberOfQuestions;

  Future<void> getNumofQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _numberOfQuestions = prefs.getInt('num_of_math_questions') ?? 5;
    });
  }

  @override
  void initState() {
    super.initState();
    getNumofQuestions();
  }

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
          title: 'Good job!',
          desc: 'You have answered all questions corectly!',
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
        print('done');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/game_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Consumer<MathGame>(
                  builder: (_, data, __) {
                    return QuestionWidget(
                      question: data.currentQuestion ?? '',
                      type: 2,
                    );
                  },
                ),
                SizedBox(height: 80.0),
                Canvas(checkAnswer: checkAnswer),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
