import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/components/canvas.dart';
import 'package:text_reg/components/video_widget.dart';
import 'package:text_reg/services/alphabet_number.dart';

class LS extends StatelessWidget {
  LS({@required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlphabetAndNumber(),
      child: LearningScreen(type: type),
    );
  }
}

class LearningScreen extends StatefulWidget {
  LearningScreen({@required this.type});

  final int type;

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    AlphabetAndNumber game =
        Provider.of<AlphabetAndNumber>(context, listen: false);
    game.setData(widget.type);
    game.getFirstElement();

    void checkAnswer(String answer) {
      if (game.checkAnswer(answer)) {
        print('correct');
        game.currentIndex++;
        game.getNextElement();
      } else
        print('wrong');
      if (game.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'All done!',
          buttons: [
            DialogButton(
              child: Text('Reset'),
              onPressed: () {
                game.resetGame();
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Consumer<AlphabetAndNumber>(
                builder: (_, data, __) {
                  return VideoWidget(
                    fileName: data.currentElement,
                    type: widget.type,
                  );
                },
              ),
              SizedBox(height: 10.0),
              Canvas(checkAnswer: checkAnswer),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  //video
  QuestionWidget(this.question);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question,
        style: TextStyle(fontSize: 60.0),
      ),
    );
  }
}
