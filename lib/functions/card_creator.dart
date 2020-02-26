import 'package:flutter/material.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/models/load.dart';
import 'package:port_tracker/ui/components/device_card.dart';
import 'package:port_tracker/ui/components/load_card.dart';

List<Widget> createCurrentDeviceCard() {
  List<Widget> customCards = List<Widget>();
  customCards.add(DeviceCard(currentDevice));
  return customCards;
}

List<Widget> createCurrentLoadsCards() {
  List<Widget> customCards = List<Widget>();
  for (Load load in currentDevice.loads) {
    customCards.add(LoadCard(load));
  }
  return customCards;
}

List<Widget> createUnfinshedCurrentLoadsCards() {
  List<Widget> customCards = List<Widget>();
  for (Load load in currentDevice.loads) {
    if (!load.finished) {
      customCards.add(LoadCard(load));
    }
  }
  return customCards;
}