import 'package:flutter/material.dart';
import 'package:port_tracker/functions/card_creator.dart';

class LoadsPage extends StatefulWidget {
  @override
  _LoadsPageState createState() => _LoadsPageState();
}

class _LoadsPageState extends State<LoadsPage> {
  @override
  Widget build(BuildContext context) {
    //_getLocation();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
        ),
        new ListView(
          children: createLoadCards(),
        )
      ],
    ));
  }
}
