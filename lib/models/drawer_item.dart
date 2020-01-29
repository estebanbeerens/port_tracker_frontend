import 'package:flutter/material.dart';

class DrawerItem {
  int id;
  String title;
  IconData icon;
  bool enabled;
  DrawerItem(this.title, this.icon, this.enabled);
}