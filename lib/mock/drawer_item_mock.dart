import 'package:flutter/material.dart';
import 'package:port_tracker/models/drawer_item.dart';

final drawerItemsUser = [
  new DrawerItem("Home", Icons.home, true),
  new DrawerItem("Map", Icons.map, true),
  new DrawerItem("QR Scanner", Icons.grid_on, true),
  new DrawerItem("New loads", Icons.settings_input_component, true),
  new DrawerItem("Settings", Icons.settings, true)
];

final drawerItemsModerator = [
  new DrawerItem("Home", Icons.home, true),
  new DrawerItem("Map", Icons.map, true),
  new DrawerItem("Machines", Icons.directions_car, true),
  new DrawerItem("Loads", Icons.settings_input_component, true),
  new DrawerItem("Accidents", Icons.error_outline, true),
  new DrawerItem("Settings", Icons.settings, true)
];