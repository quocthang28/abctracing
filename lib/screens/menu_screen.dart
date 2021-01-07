import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/number'),
                label: Text('1 2 3'),
                icon: Icon(Icons.navigate_next),
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/alphabetupper'),
                label: Text('A B C'),
                icon: Icon(Icons.navigate_next),
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/alphabetlower'),
                label: Text('a b c'),
                icon: Icon(Icons.navigate_next),
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/mathgame'),
                label: Text('Quick Math'),
                icon: Icon(Icons.navigate_next),
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/wordgame'),
                label: Text('Find Missing Letter'),
                icon: Icon(Icons.navigate_next),
              ),
              MaterialButton(
                padding: EdgeInsets.all(8.0),
                textColor: Colors.white,
                splashColor: Colors.greenAccent,
                elevation: 8.0,
                child: Container(
                  width: 120,
                  height: 80.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/buttons/menu_button_1.jpg'),
                        fit: BoxFit.contain),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SIGN OUT",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // ),
                onPressed: () {
                  print('Tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
