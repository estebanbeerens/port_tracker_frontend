import 'package:flutter/material.dart';
import 'package:port_tracker/ui/components/custom_card.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
                fit: BoxFit.cover
              ),
            ),
          ),
          new ListView(
            children: <Widget>[
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          )
        ],
      )
    );
  }
}
