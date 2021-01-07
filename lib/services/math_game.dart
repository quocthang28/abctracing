import 'dart:math';
import 'package:flutter/foundation.dart';

class MathQuestion {
  MathQuestion({this.question, this.answer});

  final String question;
  final int answer;
}

Random _ran = Random();
int _randomInRange(int min, int max) => min + _ran.nextInt(max - min);

class MathGame extends ChangeNotifier {
  List<MathQuestion> _mathQuestions = [];
  int _currentQuestionIndex = 0;
  String _currentQuestion;
  // ignore: unnecessary_getters_setters
  int get currentQuestionIndex => _currentQuestionIndex;
  String get currentQuestion => _currentQuestion;
  // ignore: unnecessary_getters_setters
  set currentQuestionIndex(int currentQuestionIndex) {
    _currentQuestionIndex = currentQuestionIndex;
  }

  void generateMathQuestions(int numOfQuestions) {
    int operation;
    int num1;
    int num2;
    int temp;

    for (int i = 0; i < numOfQuestions; i++) {
      operation = _ran.nextInt(4);
      num1 = _ran.nextInt(10);
      num2 = _ran.nextInt(10);
      while (num1 == num2 && operation == 1) {
        num1 = _ran.nextInt(10);
        num2 = _ran.nextInt(10);
      }
      if (operation == 0) {
        _mathQuestions.add(
            MathQuestion(question: '$num1 + $num2 = ?', answer: num1 + num2));
      } else if (operation == 1) {
        if (num1 < num2) {
          temp = num1;
          num1 = num2;
          num2 = temp;
        }
        _mathQuestions.add(
            MathQuestion(question: '$num1 - $num2 = ?', answer: num1 - num2));
      } else if (operation == 2) {
        if (num1 == 0) num1 = _randomInRange(1, 10);
        if (num2 == 0) num2 = _randomInRange(1, 10);
        _mathQuestions.add(
            MathQuestion(question: '$num1 × $num2 = ?', answer: num1 * num2));
      } else if (operation == 3) {
        num1 = _randomInRange(1, 10);
        num2 = _randomInRange(1, 10);
        while (num1 % num2 != 0) {
          num1 = _randomInRange(1, 10);
          num2 = _randomInRange(1, 10);
        }
        _mathQuestions.add(
            MathQuestion(question: '$num1 ÷ $num2 = ?', answer: num1 ~/ num2));
      }
    }
    _currentQuestion = _mathQuestions.first.question;
  }

  void getNextQuestion() {
    if (_currentQuestionIndex == _mathQuestions.length) {
      _currentQuestion = 'Done!';
    } else
      _currentQuestion = _mathQuestions[_currentQuestionIndex].question;
    notifyListeners();
  }

  String processAnswer(String answer) {
    String ans = answer.replaceAll(new RegExp(r'[^0-9]'), '');
    switch (answer) {
      case 'O':
        return '0';
        break;
      case 'o':
        return '0';
        break;
      case 'g':
        return '9';
        break;
      case 'M':
        return '11';
      case 'S':
        return '5';
        break;
      default:
        return ans;
        break;
    }
  }

  bool checkAnswer(String answer) {
    return _mathQuestions[_currentQuestionIndex].answer.toString() ==
        processAnswer(answer);
  }

  bool isFinished() {
    return _currentQuestionIndex == _mathQuestions.length;
  }

  void resetGame() {
    _currentQuestionIndex = 0;
    _mathQuestions.clear();
    notifyListeners();
  }
}
