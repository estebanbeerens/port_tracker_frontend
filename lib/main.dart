import 'package:flutter/material.dart';
import 'package:port_tracker/components/main_drawer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Port Tracker',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new MainDrawer(),
    );
  }
}

//Then we run our app
void main() => runApp(new MyApp());
