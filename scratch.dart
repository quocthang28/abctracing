// Stream<int> numberStream() async* {
//   for (var i = 0; i < 10; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     yield i;
//   }
// }

// void main() async {
//   Stream<int> numStream = numberStream();
//   numStream.listen((value) {
//     print(value);
//   });

//   // for (int i = 1; i < 11; i++) {
//   //   await Future.delayed(Duration(seconds: 1));
//   //   print(i);
//   // }
// }

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

void main() {
  print(_words.length);
}
