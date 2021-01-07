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
  'Animal',
  'Apologies',
  'Book',
  'Bird',
  'Bicycle',
  'Chicken',
  'Chair',
  'Car',
  'Dog',
  'Door',
  'Doctor',
  'Engineer',
  'Ear',
  'Eye',
  'Fire',
  'Fan',
  'Food',
  'Girl',
  'Gas',
  'Gun',
  'House',
  'Horse',
  'Hill'
  'Ion',
  'Iphone',
  'Idea',
  'Jerry',
  'January'
  'June'
  'Kite',
  'Kindness'
  'KungFu'
  'Left'
  'Lonely'
  'Lamp'
  'Music',
  'Machine',
  'Math',
  'Nurse',
  'Nancy',
  'Number',
  'Orange',
  'Organization',
  'Omnitrix',
  'Picture',
  'Phone',
  'Pen',
  'Quiz',
  'Queen',
  'Quote',
  'Rabbit',
  'Rat',
  'Run',
  'Shirt',
  'Show',
  'Short',
  'Table',
  'Tall',
  'Truck',
  'Umbrella',
  'Utility',
  'Up',
  'Vertical',
  'Vehicle',
  'Van',
  'Window',
  'Word',
  'Water',
  'Xenon',
  'Yarn',
  'Yacht',
  'yellow',
  'Zues',
  'Zoombie',
  'Zone',
];

void main() {
  print(_words.length);
}
