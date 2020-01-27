import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:port_tracker/components/floating_panel.dart';
import 'package:port_tracker/mock/marker_item_mock.dart';
import 'package:port_tracker/models/Marker_item.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// Class for the markers

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Position _currentPosition;
  
  List<Marker> allMarkers = [];
  MarkerItem selectedMarker;

  PanelController floatingPanel = new PanelController();

  // Call _getLocation() and _createMarkers() when loading the page
  @override
  void initState() {
    super.initState();
    _getLocation(); 
    _createMarkers();
  }

  @override
  void dispose() { 
    super.dispose();
  }

  // Function that gets the current location and puts it in _currentPosition
  // You can pull the lat and lng from _currentposition by using .latitude and .longitude
  Future<void> _getLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  // Creates all the markers
  void _createMarkers() {
    for(var item in markerItems) {
      // BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), item.icon).then((onValue) {
      //   setState(() {
      //     pinLocationIcon = onValue;
      //   });
      // });
      allMarkers.add(
        Marker(
          markerId: MarkerId(item.id.toString()),
          icon: BitmapDescriptor.fromAsset(item.icon),
          // icon: pinLocationIcon,
          draggable: true,
          position: LatLng(item.lat, item.lng),
          onTap: () {
            selectedMarker = markerItems[item.id];
            log("Selected marker " + item.id.toString() + ": " + item.title.toString());
          },
          infoWindow: InfoWindow(
            title: item.title,
            snippet: "Click for info",
            onTap: () {
              floatingPanel.open();
            }
          )
        )
      );
    }
  }

  // The floating panel when it's collapsed
  Widget _floatingCollapsed(){
    return new GestureDetector(
      onTap: () {
        floatingPanel.open();
      },
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
        child: Center(
          child: Icon(Icons.drag_handle),
        ),
      )
    );
  }

  // The floating panel when it's opened
  Widget _floatingPanel(){
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
        ),
        margin: const EdgeInsets.all(24.0),
        child: Center(
          child: Text("No marker has been selected.")
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    // Check if the current position is known
    if (_currentPosition == null) {
      // The loading screen    
      return Scaffold(
        body: Container(
          child: Center(
            child: Loading(indicator: BallGridPulseIndicator(), size: 100.0,color: Color(0x39B1C3).withOpacity(0.9)),
          ),
      ),
    );
    } else {
      // The map screen
      return Scaffold(
        body: new SlidingUpPanel(
          renderPanelSheet: false,
          panel: _floatingPanel(),
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
                target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                zoom: 18.0,
              ),
              onMapCreated: (GoogleMapController controller) {},
              // Set the markers on the map
              markers: Set.from(allMarkers)
            ),
          ),
          // Settings for backdrop when the sliding panel is opened
          backdropEnabled: true,
          backdropOpacity: 0.2,
          // Hiehgt of sliding panel when closed
          minHeight: 100,
          controller: floatingPanel,
          ),
      );
    }
  }
}