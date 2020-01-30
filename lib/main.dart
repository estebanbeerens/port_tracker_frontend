import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:port_tracker/ui/pages/login_page.dart';
import 'package:port_tracker/ui/pages/home_page.dart';
import 'package:port_tracker/services/auth_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        future: Provider.of<AuthService>(context).getUser(),

        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.hasData ? HomePage() : LoginPage();
          } else {
            return Container(color: Colors.white);
          }
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
