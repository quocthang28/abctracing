import 'package:flutter/material.dart';
import 'package:text_reg/utils/service_locator.dart';
import 'package:text_reg/screens/math_game_screen.dart';
import 'package:text_reg/screens/word_game_screen.dart';
import 'screens/menu_screen.dart';

// void setupLoacator() {
//   GetIt.I.registerLazySingleton(() => ProcessCanvasService());
//   GetIt.I.registerLazySingleton(() => MathGame());
// }

void main() {
  //setupLoacator();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ez game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => Menu(),
        '/mathgame': (context) => MGS(),
        '/wordgame': (context) => WordGameScreen()
      },
    );
  }
}
