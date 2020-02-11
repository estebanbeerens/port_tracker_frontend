import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/ui/pages/accidents_page.dart';
import 'package:port_tracker/ui/pages/home_page.dart';
import 'package:port_tracker/ui/pages/machine_page.dart';
import 'package:port_tracker/ui/pages/map_page.dart';
import 'package:port_tracker/ui/pages/qr_page.dart';
import 'package:port_tracker/ui/pages/settings_page.dart';
import 'package:port_tracker/ui/pages/loads_page.dart';
  
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class Map extends StatelessWidget {
  final Position _selectedMarkerPosition;
  Map(this._selectedMarkerPosition);

  @override
  Widget build(BuildContext context) {
    return MapPage(_selectedMarkerPosition);
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

class Loads extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return LoadsPage();
  }
}

class Machines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MachinePage();
  }
}

class Accidents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccidentPage();
  }
}