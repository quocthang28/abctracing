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
            ],
          ),
        ),
      ),
    );
  }
}
