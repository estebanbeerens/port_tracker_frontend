import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/ui/pages/home_page.dart';
import 'package:port_tracker/ui/pages/machine_logout_page.dart';
import 'package:port_tracker/ui/pages/machine_page.dart';
import 'package:port_tracker/ui/pages/map_page.dart';
import 'package:port_tracker/ui/pages/qr_page.dart';
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

class MachineLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MachineLogoutPage();
  }
}