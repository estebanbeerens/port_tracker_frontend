import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/mock/location_mock.dart';
import 'package:port_tracker/models/load.dart';
import 'package:port_tracker/ui/components/custom_card.dart';

List<Widget> createCurrentDeviceCard() {
  List<CustomCard> customCards = List<CustomCard>();
  // if (currentDevice != null) {
    customCards.add(CustomCard(currentDevice.name, currentDevice.type, false,
        Position(longitude: double.parse(locations[0].lng), latitude: double.parse(locations[0].lat))));
  // }
  return customCards;
}

List<Widget> createCurrentLoadsCards() {
  List<CustomCard> customCards = List<CustomCard>();
  // if (currentDevice != null) {
    for (Load load in currentDevice.loads) {
      customCards.add(CustomCard(load.name, load.firm, true,
          Position(longitude: double.parse(load.startLng), latitude: double.parse(load.startLat))));
      print(load);
    }
  // }
  return customCards;
}