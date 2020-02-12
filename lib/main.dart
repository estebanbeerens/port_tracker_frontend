import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:port_tracker/ui/pages/login_page.dart';
import 'package:port_tracker/services/auth_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sets the application to always display in portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
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

//Then we run our app
void main() => runApp(
  ChangeNotifierProvider<AuthService>(
    child: MyApp(),
    create: (BuildContext context) {
      return AuthService();
    },
  ),
);
