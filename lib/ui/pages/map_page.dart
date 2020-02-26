import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/models/load.dart';
import 'package:port_tracker/ui/navigation/main_drawer.dart';

// Class for the markers

class MapPage extends StatefulWidget {
  final Position _selectedMarkerPosition;
  MapPage(this._selectedMarkerPosition);

  @override
  State<MapPage> createState() => MapPageState(_selectedMarkerPosition);
}

class MapPageState extends State<MapPage> {
  String imagePath;
  BitmapDescriptor customIcon;

  Position _selectedMarkerPosition;
  MapPageState(this._selectedMarkerPosition);

  Position _startPosition;
  
  // Call _getLocation() and _createMarkers() when loading the page
  @override
  void initState() {
    super.initState();
    _createInitialPosition();
  }

  // Checks if the map should start at your current position or the position of a marker
  void _createInitialPosition() async {
    log(_selectedMarkerPosition.toString());
    if (_selectedMarkerPosition != null) {
      _startPosition = _selectedMarkerPosition;
    } else {
      _getLocation();
    }
  }

  Future<void> _getLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
        setState(() {
          _startPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
  }

  // Creates all the markers
  List<Marker> _createMarkers() {
    List<Marker> allMarkers = [];
    if (currentDevice != null) {
      for (Load load in currentDevice.loads) {
        double lat;
        double lng;
        if (load.finished == true) {
          imagePath = "assets/images/map_markers/load/green.png";
          lat = double.parse(load.destLat);
          lng = double.parse(load.destLng);
        } else {
          imagePath = "assets/images/map_markers/load/cyan.png";
          lat = double.parse(load.startLat);
          lng = double.parse(load.startLng);
        }
        allMarkers.add(
          Marker(
            markerId: MarkerId(load.id),
            icon: BitmapDescriptor.fromAsset(imagePath),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: load.name,
              snippet: load.description,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(name: "LoadsPage"),
                    builder: (BuildContext context) =>
                      MainDrawer(2, null)),
                );
              }
            )
          )
        );                
      }
    }
    return allMarkers;
  }

  @override
  Widget build(BuildContext context) {
    // Check if the current position is known
    if (_startPosition == null) {
      // The loading screen
      return Scaffold(
        body: Container(
          child: Center(
            child: Loading(
                indicator: BallGridPulseIndicator(),
                size: 100.0,
                color: Color(0x39B1C3).withOpacity(0.9)),
          ),
        ),
      );
    } else {
      // The map screen
      return Scaffold(
        body: Center(
          child: GoogleMap(
            // Settings for the map
            compassEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            buildingsEnabled: true,
            // Set starting position on your current location
            initialCameraPosition: CameraPosition(
              target: LatLng(_startPosition.latitude, _startPosition.longitude),
              zoom: 18.0,
            ),
            onMapCreated: (GoogleMapController controller) {},
            // Set the markers on the map
            markers: Set.from(_createMarkers()),
          ),
        ),
      );
    }
  }
}
