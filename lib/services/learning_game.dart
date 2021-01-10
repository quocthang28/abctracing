import 'package:flutter/material.dart';

class LearningGame extends ChangeNotifier {
  List _numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List _alphabetUpper = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List _alphabetLower = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  List _data;
  int _currentIndex = 0;
  String _currentElement;

  String get currentElement => _currentElement;
  // ignore: unnecessary_getters_setters
  int get currentIndex => _currentIndex;
  // ignore: unnecessary_getters_setters
  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
  }

  void setData(int type) {
    _data = [];
    type == 1
        ? _data = _numbers
        : type == 2
            ? _data = _alphabetUpper
            : _data = _alphabetLower;
  }

  void getFirstElement() {
    _currentElement = _data.first.toString();
  }

  void getNextElement() {
    if (_currentIndex == _data.length) {
      _currentElement = 'Done!';
    } else
      _currentElement = _data[_currentIndex].toString();
    notifyListeners();
  }

  //TODO: REGEX XOA DAU . ? / $%##@$&
  //TODO: answer.toupper || lower;
  //B == 8

  String processAnswer(String answer, int type) {
    if (type == 1 || type == 2) return answer;
    if (type == 3) {
      if (answer == '9') {
        return 'g';
      } else if (answer == 'C' ||
          answer == 'K' ||
          answer == 'J' ||
          answer == 'L' ||
          answer == 'O' ||
          answer == 'P' ||
          answer == 'S' ||
          answer == 'V' ||
          answer == 'Q' ||
          answer == 'U' ||
          answer == 'W' ||
          answer == 'X' ||
          answer == 'Z') {
        return answer.toLowerCase();
      } else
        return answer;
    }
  }

  bool checkAnswer(String answer, int type) {
    return _data[_currentIndex].toString() == processAnswer(answer, type);
  }

  bool isFinished() {
    return _currentIndex == _data.length;
  }

  void resetGame() {
    _currentIndex = 0;
    getFirstElement();
    notifyListeners();
  }
}
