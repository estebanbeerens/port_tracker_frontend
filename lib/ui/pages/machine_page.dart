import 'package:flutter/material.dart';

class MachinePage extends StatefulWidget {
  @override
  _MachinePageState createState() => _MachinePageState();
}

class _MachinePageState extends State<MachinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
        ),
        new ListView(
          // children: createAllDeviceCards(),
        )
      ],
    ));
  }
}