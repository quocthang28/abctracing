import 'dart:math';

enum Operation { ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION }

class MathQuestion {
  MathQuestion({this.num1, this.num2, this.result, this.operation});
  
  final int num1;
  final int num2;
  final int result;
  final Operation operation;
}

Random _ran = Random();
int _randomInRange(int min, int max) => min + _ran.nextInt(max - min);

class MathGame {
  List<MathQuestion> _mathQuestions = [];
  int _currentQuestionIndex = 0;

  // ignore: unnecessary_getters_setters
  int get currentQuestionIndex => _currentQuestionIndex;

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
        _mathQuestions.add(MathQuestion(
            num1: num1,
            num2: num2,
            result: num1 + num2,
            operation: Operation.ADDITION));
      } else if (operation == 1) {
        if (num1 < num2) {
          temp = num1;
          num1 = num2;
          num2 = temp;
        }
        _mathQuestions.add(MathQuestion(
            num1: num1,
            num2: num2,
            result: num1 - num2,
            operation: Operation.SUBTRACTION));
      } else if (operation == 2) {
        if (num1 == 0) num1 = _randomInRange(1, 10);
        if (num2 == 0) num2 = _randomInRange(1, 10);
        _mathQuestions.add(MathQuestion(
            num1: num1,
            num2: num2,
            result: num1 * num2,
            operation: Operation.MULTIPLICATION));
      } else if (operation == 3) {
        num1 = _randomInRange(1, 10);
        num2 = _randomInRange(1, 10);
        while (num1 % num2 != 0) {
          num1 = _randomInRange(1, 10);
          num2 = _randomInRange(1, 10);
        }
        _mathQuestions.add(MathQuestion(
            num1: num1,
            num2: num2,
            result: num1 ~/ num2,
            operation: Operation.DIVISION));
      }
    }
  }

  String getMathQuestion() {
    if (_currentQuestionIndex == _mathQuestions.length)
      return 'Done!';
    else {
      String num1 = _mathQuestions[_currentQuestionIndex].num1.toString();
      String num2 = _mathQuestions[_currentQuestionIndex].num2.toString();
      String operation =
          _mathQuestions[_currentQuestionIndex].operation == Operation.ADDITION
              ? '+'
              : _mathQuestions[_currentQuestionIndex].operation ==
                      Operation.SUBTRACTION
                  ? '-'
                  : _mathQuestions[_currentQuestionIndex].operation ==
                          Operation.MULTIPLICATION
                      ? '×'
                      : '÷';
      return '$num1 $operation $num2 = ?';
    }
  }

  String processAnswer(String answer) {
    String res = answer.replaceAll(new RegExp(r'[^0-9]'), '');
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
        return res;
        break;
    }
  }

  bool checkAnswer(String answer) {
    return _mathQuestions[_currentQuestionIndex].result.toString() ==
        processAnswer(answer);
  }

  bool isFinished(){
    return _currentQuestionIndex == _mathQuestions.length;
  }

  void resetGame() {
    _currentQuestionIndex = 0;
    _mathQuestions.clear();
  }
}
