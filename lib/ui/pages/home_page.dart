import 'package:flutter/material.dart';
import 'package:port_tracker/functions/card_creator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover))),
      new ListView(children: createCurrentDeviceCard() + createCurrentLoadsCards())
    ]));
  }
}
