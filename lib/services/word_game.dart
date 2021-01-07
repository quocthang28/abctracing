import 'dart:math';

import 'package:flutter/foundation.dart';

class WordQuestion {
  WordQuestion({this.missingLetter, this.unfinishedWord});

  final String missingLetter;
  final String unfinishedWord;
}

Random _ran = Random();

class WordGame extends ChangeNotifier {
  List<String> _words = [
    'Apple',
    'Orange',
    'Car',
    'Hand',
    'Bottle',
    'Window',
    'Truck',
    'Book',
    'Rabbit',
    'Dog',
    'House',
    'Picture',
    'Animal',
    'Music',
    'Ball',
    'Girl',
    'Bird',
    'Bicycle',
    'Chicken',
    'Chair',
    'Table',
    'Door',
    'Phone',
    'Doctor',
    'Nurse',
    'Engineer',
    'Fire',
    'Water',
    'Shirt',
    //'Floccinaucinihilipilification'
  ];
  Set<WordQuestion> _wordQuestions = {};
  int _currentQuestionIndex = 0;
  String _currentQuestion;

  // ignore: unnecessary_getters_setters
  int get currentQuestionIndex => _currentQuestionIndex;
  String get currentQuestion => _currentQuestion;

  // ignore: unnecessary_getters_setters
  set currentQuestionIndex(int currentQuestionIndex) {
    _currentQuestionIndex = currentQuestionIndex;
  }

  void generateWordQuestions(int numOfQuestions) {
    String word;
    String missingLetter;
    String unfishedWord;
    int position;
    while (_wordQuestions.length < numOfQuestions) {
      word = _words[Random().nextInt(_words.length)];
      position = _ran.nextInt(word.length);
      missingLetter = word.substring(position, position + 1);
      while (missingLetter == 'o' || missingLetter == 'O') {
        position = _ran.nextInt(word.length);
        missingLetter = word.substring(position, position + 1);
      }
      unfishedWord =
          word.substring(0, position) + '_' + word.substring(position + 1);
      _wordQuestions.add(WordQuestion(
          missingLetter: missingLetter.toUpperCase(),
          unfinishedWord: unfishedWord.toUpperCase()));
    }
    _currentQuestion = _wordQuestions.first.unfinishedWord;
  }

  void getWordQuestion() {
    if (_currentQuestionIndex == _wordQuestions.length)
      _currentQuestion = 'Done';
    else {
      _currentQuestion =
          _wordQuestions.elementAt(_currentQuestionIndex).unfinishedWord;
    }
    notifyListeners();
  }

  bool checkAnswer(String answer) {
    return _wordQuestions
            .elementAt(_currentQuestionIndex)
            .missingLetter
            .toLowerCase() ==
        answer.toLowerCase();
  }

  bool isFinished() {
    return _currentQuestionIndex == _wordQuestions.length;
  }

  void resetGame() {
    _currentQuestionIndex = 0;
    _wordQuestions.clear();
    notifyListeners();
  }
}
