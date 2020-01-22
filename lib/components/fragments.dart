import 'package:flutter/material.dart';
import 'package:port_tracker/pages/home_page.dart';
import 'package:port_tracker/pages/map_page.dart';
import 'package:port_tracker/pages/qr_page.dart';
import 'package:port_tracker/pages/settings_page.dart';
  
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapPage();
  }
}

class Qr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QrPage();
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsPage();
  }
}
