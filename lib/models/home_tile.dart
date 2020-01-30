import 'package:flutter/material.dart';

class HomeTile {
  int id;
  String tileName;
  String location;
  IconData icon;
  double lat;
  double lng;
  HomeTile(this.tileName, this.location, this.icon, this.lat, this.lng);
}