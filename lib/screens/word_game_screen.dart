import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/services/word_game.dart';
import 'package:text_reg/components/canvas.dart';

class WGS extends ChangeNotifierProvider {
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
  WordGame get wordGame => GetIt.I<WordGame>();
  int _numberOfQuestions = 3; //TODO: implement sharedpreferences (user setting)

  void checkAnswer(String answer) {
    //callback
    if (wordGame.checkAnswer(answer)) {
      print('correct');
      setState(() {
        wordGame.currentQuestionIndex++;
      });
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
              setState(() {
                wordGame.resetGame();
              });
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

  @override
  void initState() {
    super.initState();
    wordGame.resetGame();
    wordGame.generateWordQuestions(_numberOfQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Stack CANVAS & HINT here
              QuestionWidget(wordGame.getWordQuestion()),
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
  QuestionWidget(this.result);

  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        result,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}
