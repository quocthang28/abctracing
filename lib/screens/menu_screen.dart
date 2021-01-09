import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background/menu.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/mathgame'),
                label: Text(
                  'Quick Math',
                  style: TextStyle(
                    fontFamily: "PatrickHand",
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.navigate_next,
                  size: 40.0,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(15, 204, 181, 1.0),
                minWidth: 250.0,
                height: 50.0,
                padding: EdgeInsets.fromLTRB(0, 0, 85.0, 0),
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/wordgame'),
                label: Text(
                    'Find Missing Letter',
                    style: TextStyle(
                    fontFamily: "PatrickHand",
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                  ),
                icon: Icon(
                  Icons.navigate_next,
                  size: 40.0,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(23, 170, 217, 1.0),
                minWidth: 250.0,
                height: 50.0,
                padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/number'),
                label: Text(
                    'Number',
                    style: TextStyle(
                    fontFamily: "PatrickHand",
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.navigate_next,
                  size: 40.0,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(227, 61, 24, 1.0),
                minWidth: 250.0,
                height: 50.0,
                padding: EdgeInsets.fromLTRB(0, 0, 105.0, 0),
              ),
              SizedBox(
                height: 180.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left : 338.0),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                    //size: 40.0,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/setting'),
                  iconSize: 40.0,               
                  //padding: const EdgeInsets.fromLTRB(300.0, 0, 0, 0),
                  ),
              ),
            ],
          ),
        ),
      ),     
    );
  }
}
