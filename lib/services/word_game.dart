import 'dart:math';

class WordQuestion {
  WordQuestion({this.word, this.missingLetter, this.unfinishedWord});

  String word;
  String missingLetter;
  String unfinishedWord;
}

Random _ran = Random();

class WordGame {
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
    'Cat',
    'Bicycle',
    'Chicken',
    'Chair',
    'Table',
    'Door',
    'Floccinaucinihilipilification'
  ];
  Set<WordQuestion> _wordQuestions = {};
  int _currentQuestionIndex = 0;

  // ignore: unnecessary_getters_setters
  int get currentQuestionIndex => _currentQuestionIndex;

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
      unfishedWord =
          word.substring(0, position) + '_' + word.substring(position + 1);
      _wordQuestions.add(WordQuestion(
          word: word,
          missingLetter: missingLetter,
          unfinishedWord: unfishedWord));
    }
  }

  String getWordQuestion() {
    if (_currentQuestionIndex == _wordQuestions.length)
      return 'Done!';
    else {
      return _wordQuestions.elementAt(_currentQuestionIndex).unfinishedWord;
    }
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
  }
}
