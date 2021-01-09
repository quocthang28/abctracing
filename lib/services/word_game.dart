import 'dart:math';

import 'package:flutter/foundation.dart';

class WordQuestion {
  WordQuestion({this.word, this.missingLetter, this.unfinishedWord});

  final String word;
  final String missingLetter;
  final String unfinishedWord;
}

Random _ran = Random();

class WordGame extends ChangeNotifier {
  List<String> _words = [
    'Apple',
    'Animal',
    'Apologies',
    'Book',
    'Bird',
    'Bicycle',
    'Chess',
    'Chicken',
    'Chair',
    'Car',
    'Dog',
    'Door',
    'Doctor',
    'Engineer',
    'Eye',
    'Fire',
    'Fan',
    'Food',
    'Girl',
    'Gas',
    'Gun',
    'House',
    'Horse',
    'Hill',
    'Ion',
    'Iphone',
    'Idea',
    'Jerry',
    'Juice',
    'Judge',
    'Kite',
    'Kindness',
    'KungFu',
    'Left',
    'Lamp',
    'Music',
    'Machine',
    'Math',
    'Nurse',
    'Nancy',
    'Number',
    'Orange',
    'Owl',
    'Omnitrix',
    'Phone',
    'Pen',
    'Quiz',
    'Quote',
    'Rabbit',
    'Rat',
    'Run',
    'Shirt',
    'Shark',
    'Sun',
    'Shout',
    'Table',
    'Truck',
    'Umbrella',
    'Utility',
    'Vase',
    'Vehicle',
    'Van',
    'Window',
    'Water',
    'Xenon',
    'Yarn',
    'Yacht',
    'Sun',
    'Zues',
    'Zombie',
    'Zebra',
  ];
  //List _words = ['Owl'];

  Set<WordQuestion> _wordQuestions = {};
  int _currentQuestionIndex = 0;
  String _currentQuestion;
  String _currentWord;

  // ignore: unnecessary_getters_setters
  int get currentQuestionIndex => _currentQuestionIndex;
  String get currentQuestion => _currentQuestion;
  String get currentWord => _currentWord;

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
      word = _words[_ran.nextInt(_words.length)];
      if (!_wordQuestions.contains(word)) {
        position = _ran.nextInt(word.length);
        missingLetter = word.substring(position, position + 1);
        while (missingLetter == 'o' || missingLetter == 'O') {
          position = _ran.nextInt(word.length);
          missingLetter = word.substring(position, position + 1);
        }
        unfishedWord =
            word.substring(0, position) + '_' + word.substring(position + 1);
        _wordQuestions.add(WordQuestion(
            word: word,
            missingLetter: missingLetter.toUpperCase(),
            unfinishedWord: unfishedWord.toUpperCase()));
      }
    }
    _currentQuestion = _wordQuestions.first.unfinishedWord;
    _currentWord = _wordQuestions.first.word;
  }

  void getWordQuestion() {
    if (_currentQuestionIndex == _wordQuestions.length)
      _currentQuestion = 'Done';
    else {
      _currentQuestion =
          _wordQuestions.elementAt(_currentQuestionIndex).unfinishedWord;
      _currentWord = _wordQuestions.elementAt(_currentQuestionIndex).word;
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
