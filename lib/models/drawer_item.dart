import 'package:flutter/material.dart';

class DrawerItem {
  int id;
  String title;
  IconData icon;
  bool enabled;
  DrawerItem(this.title, this.icon, this.enabled);
}

final drawerItemsUser = [
  new DrawerItem("Home", Icons.home, true),
  new DrawerItem("Map", Icons.map, true),
  new DrawerItem("QR scanner", Icons.grid_on, true),
  new DrawerItem("New loads", Icons.settings_input_component, true)
];

final drawerItemsModerator = [
  new DrawerItem("Home", Icons.home, true),
  new DrawerItem("Map", Icons.map, true),
  new DrawerItem("Machines", Icons.local_shipping, true),
  new DrawerItem("Loads", Icons.dashboard, true)
];