import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/mock/load_mock.dart';
import 'package:port_tracker/ui/components/custom_card.dart';

List<Widget> createLoadCards() {
  List<CustomCard> customCards = List<CustomCard>();
  for (var load in loads) {
    customCards.add(CustomCard(load.name, load.firm, true,
        Position(longitude: load.startLng, latitude: load.startLat)));
  }
  return customCards;
}
