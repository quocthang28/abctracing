import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:text_reg/components/canvas.dart';
import 'package:text_reg/components/gif_widget.dart';
import 'package:text_reg/services/learning_game.dart';

class LS extends StatelessWidget {
  LS({@required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LearningGame(),
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
    LearningGame game = Provider.of<LearningGame>(context, listen: false);
    game.setData(widget.type);
    game.getFirstElement();

    void checkAnswer(String answer) {
      if (game.checkAnswer(answer, widget.type)) {
        print('correct');
        game.currentIndex++;
        game.getNextElement();
      } else
        print('wrong');
      if (game.isFinished()) {
        Alert(
          context: context,
          title: 'Good job!',
          desc: 'You have answered all questions corectly!',
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
                Consumer<LearningGame>(
                  builder: (_, data, __) {
                    return data.currentElement == 'Done!'
                        ? Text('Done!')
                        : GIFWidget(
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
