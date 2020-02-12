import 'package:flutter/material.dart';

class MachineLogoutPage extends StatefulWidget {
  @override
  _MachineLogoutPageState createState() => _MachineLogoutPageState();
}

class _MachineLogoutPageState extends State<MachineLogoutPage> {
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
           child: new Text("Yeet", style: new TextStyle(fontSize: 35.0),),
          )
        ],
      ),
    );
  }
}