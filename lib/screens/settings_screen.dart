import 'package:flutter/material.dart';

class GameSetting extends StatefulWidget {
  @override
  _GameSettingScreen createState() => _GameSettingScreen();
}

class _GameSettingScreen extends State<GameSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Setting', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
             SizedBox(
                height: 15.0,
              ),
            Card(
              child: ListTile(
                //leading: Text('Số câu hỏi', style: TextStyle(fontSize: 20.0),),
                title: Text('Number of word questions:', style: TextStyle(fontSize: 20.0),),
                  trailing: Container(
                  width: 90.0,
                  child: TextField(decoration: InputDecoration(
                    hintText: "Number"
                  ),
                  keyboardType: TextInputType.number,
                  ),
                ),
              )
            ),
             SizedBox(
                height: 15.0,
              ),
            Card(
              child: ListTile(
                //leading: Text('Số câu hỏi', style: TextStyle(fontSize: 20.0),),
                title: Text('Number of math questions:', style: TextStyle(fontSize: 20.0),),
                  trailing: Container(
                  width: 90.0,
                  child: TextField(decoration: InputDecoration(
                    hintText: "Number"
                  ),
                  keyboardType: TextInputType.number,
                  ),
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}
