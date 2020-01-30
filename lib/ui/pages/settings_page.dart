import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
                fit: BoxFit.cover
              ),
            ),
          ),
          new Center(
           child: new Text("Settings", style: new TextStyle(fontSize: 35.0),),
          )
        ],
      )
    );
  }
}