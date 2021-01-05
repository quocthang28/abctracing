import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/services/word_game.dart';
import 'package:text_reg/components/canvas.dart';

class WGS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordGame(),
      child: WordGameScreen(),
    );
  }
}

class WordGameScreen extends StatefulWidget {
  @override
  _WordGameScreenState createState() => _WordGameScreenState();
}

class _WordGameScreenState extends State<WordGameScreen> {
  int _numberOfQuestions = 3; //TODO: implement sharedpreferences (user setting)

  @override
  Widget build(BuildContext context) {
    WordGame wordGame = Provider.of<WordGame>(context, listen: false);
    wordGame.generateWordQuestions(_numberOfQuestions);

    print('build screen');

    void checkAnswer(String answer) {
      //callback
      if (wordGame.checkAnswer(answer)) {
        print('correct');
        wordGame.currentQuestionIndex++;
        wordGame.getWordQuestion();
      } else
        print('wrong');
      if (wordGame.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'All done!',
          buttons: [
            DialogButton(
              child: Text('Reset'),
              onPressed: () {
                wordGame.resetGame();
                wordGame.generateWordQuestions(_numberOfQuestions);
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<WordGame>(
                builder: (context, data, child) {
                  return QuestionWidget(
                    data.currentQuestion ?? '',
                  );
                },
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
