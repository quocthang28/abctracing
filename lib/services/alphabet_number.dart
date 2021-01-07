import 'package:flutter/material.dart';

class AlphabetAndNumber extends ChangeNotifier {
  List _numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List _alphabetUpper = ['A', 'B', 'C'];
  List _alphabetLower = ['a', 'b', 'c'];
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

  bool checkAnswer(String answer) {
    return _data[_currentIndex].toString() == answer;
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
