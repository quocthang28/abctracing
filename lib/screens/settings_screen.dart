import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _GameSettingScreen createState() => _GameSettingScreen();
}

class _GameSettingScreen extends State<SettingScreen> {
  TextEditingController wordController;
  TextEditingController mathController;
  int numOfWordQuestions;
  int numOfMathQuestions;

  Future<void> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      numOfWordQuestions = prefs.getInt('num_of_word_questions') ?? 5;
      numOfMathQuestions = prefs.getInt('num_of_math_questions') ?? 5;
    });
  }

  Future<void> setWordQuestions(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('num_of_word_questions', amount);
  }

  Future<void> setMathQuestions(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('num_of_math_questions', amount);
  }

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    wordController = TextEditingController(text: '$numOfWordQuestions');
    mathController = TextEditingController(text: '$numOfMathQuestions');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Settings', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text(
                    'Number of math questions:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Container(
                    width: 60.0,
                    child: TextField(
                      controller: mathController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                      onSubmitted: (value) {
                        setMathQuestions(int.parse(value));
                        getSettings();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text(
                    'Number of word questions:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Container(
                    width: 60.0,
                    child: TextField(
                      controller: wordController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                      onSubmitted: (value) {
                        setWordQuestions(int.parse(value));
                        getSettings();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
