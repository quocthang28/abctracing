// import 'dart:math';

// class WordQuestion {
//   WordQuestion({this.word, this.unfinishedWord, this.missingLetter});

//   String word;
//   String unfinishedWord;
//   String missingLetter;
// }

// Random _ran = Random();
// int _randomInRange(int min, int max) => min + _ran.nextInt(max - min);

// class WordGame {
//   List<String> _words = [
//     'Apple',
//     'Orange',
//     'Car',
//     'Hand',
//     'Bottle',
//     'Window',
//     'Truck',
//     'Book',
//     'Rabbit',
//     'Dog',
//     'House',
//     'Picture',
//     'Animal',
//     'Music',
//     'Ball',
//     'Girl',
//     'Bird',
//     'Cat',
//     'Bicycle',
//     'Chicken',
//     'Chair',
//     'Table',
//     'Door',
//     'Floccinaucinihilipilification'
//   ];

//   Set<WordQuestion> _wordQuestions = {};
//   int _currentQuestionIndex = 0;

//   // ignore: unnecessary_getters_setters
//   int get currentQuestionIndex => _currentQuestionIndex;

//   // ignore: unnecessary_getters_setters
//   set currentQuestionIndex(int currentQuestionIndex) {
//     _currentQuestionIndex = currentQuestionIndex;
//   }

//   void generateWordQuestions(int numOfQuestions) {
//     String word;
//     String missingLetter;
//     String unfishedWord;
//     int position;
//     while (_wordQuestions.length < numOfQuestions) {
//       word = _words[Random().nextInt(_words.length)];
//       position = _ran.nextInt(word.length);
//       missingLetter = word.substring(position, position + 1);
//       unfishedWord =
//           word.substring(0, position) + '_' + word.substring(position + 1);
//       _wordQuestions.add(WordQuestion(
//           word: word,
//           unfinishedWord: unfishedWord,
//           missingLetter: missingLetter));
//     }

//     for (var e in _wordQuestions) {
//       print(e.word);
//       print(e.unfinishedWord);
//       print(e.missingLetter);
//       print('----------');
//     }

//     print(_wordQuestions.length);
//   }
// }

// void main() {
//   WordGame wg = WordGame();
//   wg.generateWordQuestions(10);
// }

Stream<int> numberStream() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  Stream<int> numStream = numberStream();
  numStream.listen((value) {
    print(value);
  });

  // for (int i = 1; i < 11; i++) {
  //   await Future.delayed(Duration(seconds: 1));
  //   print(i);
  // }
}
