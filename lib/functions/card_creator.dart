import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/mock/device_mock.dart';
import 'package:port_tracker/mock/load_mock.dart';
import 'package:port_tracker/mock/location_mock.dart';
import 'package:port_tracker/ui/components/custom_card.dart';

List<Widget> createAllLoadCards() {
  List<CustomCard> customCards = List<CustomCard>();
  for (var load in loads) {
    customCards.add(CustomCard(load.name, load.firm, true,
        Position(longitude: double.parse(load.startLng), latitude: double.parse(load.startLat))));
  }
  return customCards;
}

List<Widget> createAllDeviceCards() {
  List<CustomCard> customCards = List<CustomCard>();
  for (var device in devices) {
    customCards.add(CustomCard(device.name, device.type, false,
        Position(longitude: double.parse(locations[0].lng), latitude: double.parse(locations[0].lat))));
  }
  return customCards;
}
