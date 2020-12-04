import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/services/word_game.dart';
import 'package:text_reg/components/canvas.dart';

class WordGameScreen extends StatefulWidget {
  //math game sceen
  WordGame get wordGame => GetIt.I<WordGame>();

  @override
  _WordGameScreenState createState() => _WordGameScreenState();
}

class _WordGameScreenState extends State<WordGameScreen> {
  int _numberOfQuestions = 3; //TODO: implement sharedpreferences (user setting)

  void checkAnswer(String answer) {
    //callback
    if (widget.wordGame.checkAnswer(answer)) {
      print('correct');
      setState(() {
        widget.wordGame.currentQuestionIndex++;
      });
    } else
      print('wrong');
    if (widget.wordGame.isFinished()) {
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'All done!',
        buttons: [
          DialogButton(
            child: Text('Reset'),
            onPressed: () {
              setState(() {
                widget.wordGame.resetGame();
              });
              widget.wordGame.generateWordQuestions(_numberOfQuestions);
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
    widget.wordGame.resetGame();
    widget.wordGame.generateWordQuestions(_numberOfQuestions);
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
              TextWidget(widget.wordGame.getWordQuestion()),
              Canvas(checkAnswer: checkAnswer),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  //maybe video, image...
  TextWidget(this.result);

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
