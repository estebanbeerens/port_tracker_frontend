import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:port_tracker/ui/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sets the application to always display in portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Port Tracker',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Roboto'
      ),
      home: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          return LoginPage();
        }
      ),
    );
  }
}