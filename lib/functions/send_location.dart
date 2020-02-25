import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:port_tracker/application/commands/location/send-location.command.dart';
import 'package:port_tracker/domain/interfaces/i-command.dart';
import 'package:port_tracker/domain/interfaces/i-event-publisher.dart';
import 'package:port_tracker/functions/get_location.dart';
import 'package:port_tracker/globals.dart';


IEventPublisher _publisher;
Timer locationTracking;

void startLocationTracking(bool shouldTrack) {
  _publisher = GetIt.I<IEventPublisher>();

  if (shouldTrack) {
    locationTracking = Timer.periodic(Duration(seconds: 5), (Timer t) => sendLocation());
  } else {
    locationTracking.cancel();
  }
}

void sendLocation() async {
  Position currentPosition = await getLocation();
  
  ICommand sendLocationCommand =
      SendLocationCommand.build(currentPosition.latitude.toString(), currentPosition.longitude.toString(), currentDevice.id, loggedInAccount.id);

  _publisher.publish(sendLocationCommand.execute());
}