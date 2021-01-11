import 'package:button3d/button3d.dart';
import 'package:flutter/material.dart';

const kMenuButtonTextStyle = TextStyle(fontSize: 50.0, color: Colors.white);
const kMenuButtonTextStyle2 = TextStyle(fontSize: 40.0, color: Colors.white);

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Smart Kid',
                style: TextStyle(
                  fontFamily: 'Bubble',
                    color: Colors.brown[700],
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50.0),
              MenuButton(
                title: '1 2 3',
                routeName: '/number',
                topColor: Colors.red,
                backColor: Colors.red[900],
                width: 140.0,
                height: 50.0,
              ),
              SizedBox(height: 25.0),
              MenuButton(
                title: 'A B C',
                routeName: '/alphabetupper',
                topColor: Colors.orange,
                backColor: Colors.orange[900],
                width: 140.0,
                height: 50.0,
              ),
              SizedBox(height: 25.0),
              MenuButton(
                title: 'a b c',
                routeName: '/alphabetlower',
                topColor: Colors.green,
                backColor: Colors.green[900],
                width: 140.0,
                height: 50.0,
              ),
              SizedBox(height: 25.0),
              MenuButton(
                title: 'Quick Math',
                routeName: '/mathgame',
                topColor: Colors.blue,
                backColor: Colors.blue[900],
                width: 250.0,
                height: 60.0,
                textStyle: kMenuButtonTextStyle2,
              ),
              SizedBox(height: 25.0),
              MenuButton(
                title: 'Missing Letter',
                routeName: '/wordgame',
                topColor: Colors.purple,
                backColor: Colors.purple[900],
                width: 300.0,
                height: 60.0,
                textStyle: kMenuButtonTextStyle2,
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.brown[800],
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                    iconSize: 60.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  MenuButton(
      {this.title,
      this.routeName,
      this.topColor,
      this.backColor,
      this.width,
      this.height,
      this.textStyle = kMenuButtonTextStyle});

  final String title;
  final String routeName;
  final Color topColor;
  final Color backColor;
  final double width;
  final double height;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Button3d(
      width: width,
      height: height,
      style: Button3dStyle(
        topColor: topColor,
        backColor: backColor,
      ),
      child: Text(
        title,
        style: textStyle,
      ),
      onPressed: () => Navigator.pushNamed(context, routeName),
    );
  }
}
