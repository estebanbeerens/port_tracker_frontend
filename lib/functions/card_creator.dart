import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/mock/location_mock.dart';
import 'package:port_tracker/models/load.dart';
import 'package:port_tracker/ui/components/custom_card.dart';

List<Widget> createCurrentDeviceCard() {
  List<CustomCard> customCards = List<CustomCard>();
  // if (currentDevice != null) {
    customCards.add(CustomCard(currentDevice, currentDevice.name, currentDevice.type, false,
        Position(latitude: double.parse(locations[0].lat), longitude: double.parse(locations[0].lng))));
  // }
  return customCards;
}

List<Widget> createCurrentLoadsCards() {
  List<CustomCard> customCards = List<CustomCard>();
  // if (currentDevice != null) {
    for (Load load in currentDevice.loads) {
      double lat; double lng;
      if (load.finished == true) {
        lat = double.parse(load.destLat);
        lng = double.parse(load.destLng);
      } else {
        lat = double.parse(load.startLat);
        lng = double.parse(load.startLng);
      }
      customCards.add(CustomCard(load, load.name, load.firm, true,
          Position(latitude: lat, longitude: lng)));
      print(load);
    }
  // }
  return customCards;
}