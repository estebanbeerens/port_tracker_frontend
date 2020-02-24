import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/models/load.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:port_tracker/ui/components/floating_panel.dart';

// Class for the markers

class MapPage extends StatefulWidget {
  final Position _selectedMarkerPosition;
  MapPage(this._selectedMarkerPosition);

  @override
  State<MapPage> createState() => MapPageState(_selectedMarkerPosition);
}

class MapPageState extends State<MapPage> {
  Position _selectedMarkerPosition;
  MapPageState(this._selectedMarkerPosition);

  Position _startPosition;
  // List<Marker> allMarkers = [];

  PanelController floatingPanelMap = new PanelController();

  // Call _getLocation() and _createMarkers() when loading the page
  @override
  void initState() {
    super.initState();
    _createInitialPosition();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void _createInitialPosition() async {
    log(_selectedMarkerPosition.toString());
    if (_selectedMarkerPosition != null) {
      _startPosition = _selectedMarkerPosition;
    } else {
      _getLocation();
    }
  }

  // Function that gets the current location and puts it in _currentPosition
  // You can pull the lat and lng from _currentposition by using .latitude and .longitude
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
        allLoads.add(load);
        String imagePath;
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
        
        allMarkers.add(Marker(
            markerId: MarkerId(load.id),
            icon: BitmapDescriptor.fromAsset(imagePath),
            position: LatLng(lat, lng),
            onTap: () {
              setState(() {
                selectedLoad = getLoadById(allLoads, load.id);
              });
            },
            infoWindow: InfoWindow(
                title: load.name,
                snippet: "Click for info",
                onTap: () {
                  floatingPanelMap.open();
                })));
      }
    }
    return allMarkers;
  }

  // The floating panel when it's collapsed
  Widget _floatingCollapsed() {
    return new GestureDetector(
        onTap: () {
          floatingPanelMap.open();
        },
        child: new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
          ),
          margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child: Center(
            child: Icon(Icons.drag_handle),
          ),
        ));
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
        body: new SlidingUpPanel(
          renderPanelSheet: false,
          panel: FloatingPanel(),
          collapsed: _floatingCollapsed(),
          body: Center(
            child: GoogleMap(
              // Settings for the map
              compassEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              buildingsEnabled: true,
              // Set starting position on your current location
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(_startPosition.latitude, _startPosition.longitude),
                zoom: 18.0,
              ),
              onMapCreated: (GoogleMapController controller) {},
              // Set the markers on the map
              markers: Set.from(_createMarkers()),
            ),
          ),
          controller: floatingPanelMap,
          // Settings for backdrop when the sliding panel is opened
          backdropEnabled: true,
          backdropOpacity: 0.2,
          // Hiehgt of sliding panel when closed
          minHeight: 100,
        ),
      );
    }
  }
}
