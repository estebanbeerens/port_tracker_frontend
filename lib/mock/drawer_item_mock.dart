import 'package:flutter/material.dart';
import 'package:port_tracker/models/drawer_item.dart';

final drawerItemsUser = [
  new DrawerItem("Home", Icons.home, true),
  new DrawerItem("Map", Icons.map, true),
  new DrawerItem("QR scanner", Icons.grid_on, true),
  new DrawerItem("New loads", Icons.settings_input_component, true),
  new DrawerItem("Settings", Icons.settings, true)
];

final drawerItemsModerator = [
  new DrawerItem("Home", Icons.home, true),
  new DrawerItem("Map", Icons.map, true),
  new DrawerItem("Machines", Icons.local_shipping, true),
  new DrawerItem("Loads", Icons.dashboard, true),
  new DrawerItem("Accidents", Icons.error_outline, true),
  new DrawerItem("Settings", Icons.settings, true)
];