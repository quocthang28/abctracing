import 'package:flutter/material.dart';
import 'package:text_reg/screens/learning_screen.dart';
import 'package:text_reg/screens/settings_screen.dart';
import 'package:text_reg/utils/service_locator.dart';
import 'package:text_reg/screens/math_game_screen.dart';
import 'package:text_reg/screens/word_game_screen.dart';
import 'screens/menu_screen.dart';

void main() {
  //setupLoacator();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ez game',
      theme: ThemeData(
        fontFamily: 'CoolCrayon',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => Menu(),
        '/number': (context) => LS(type: 1),
        '/alphabetupper': (context) => LS(type: 2),
        '/alphabetlower': (context) => LS(type: 3),
        '/mathgame': (context) => MGS(),
        '/wordgame': (context) => WGS(),
        '/settings': (context) => SettingScreen()
      },
    );
  }
}
