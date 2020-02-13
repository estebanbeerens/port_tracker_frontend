import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:port_tracker/functions/get_location.dart';

class Distance extends StatefulWidget {
  final Position devicePosition;
  Distance(this.devicePosition);

  @override
  _DistanceState createState() => _DistanceState(devicePosition);
}

class _DistanceState extends State<Distance> {
  final Position devicePosition;
  _DistanceState(this.devicePosition);

  String distanceText;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _initialize();
  }
  
  Future<void> _initialize() async {
    _currentPosition = await getLocation();
    _getDistance(devicePosition, _currentPosition);
  }

  void _getDistance(Position position, Position currentPosition) {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .distanceBetween(_currentPosition.latitude, _currentPosition.longitude,
            position.latitude, position.longitude)
        .then((double distance) {
      setState(() {
        distanceText = distance.round().toString();
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (distanceText == null) {
      return Loading(indicator: BallPulseIndicator(), color: Colors.black87);
      // return Text("...");
    } else {
      return Text(distanceText + " m");
    }
  }
}
