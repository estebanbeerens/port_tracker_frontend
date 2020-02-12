import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:port_tracker/mock/device_mock.dart';
import 'package:port_tracker/mock/load_mock.dart';
import 'package:port_tracker/mock/location_mock.dart';
import 'package:port_tracker/models/marker_item.dart';
import 'package:provider/provider.dart';
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
  MarkerItem _selectedMarker;

  List<Marker> allMarkers = [];

  PanelController floatingPanelMap = new PanelController();

  // Call _getLocation() and _createMarkers() when loading the page
  @override
  void initState() {
    super.initState();
    _createInitialPosition();
    _createMarkers();
  }

  @override
  void dispose() {
    super.dispose();
  }

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

  List<MarkerItem> createAllMarkerItems() {
    var id = 0;
    List<MarkerItem> markerItems = [];
    for (var load in loads) {
      markerItems.add(new MarkerItem(
          id,
          load.name,
          load.firm,
          "assets/images/map_markers/load/cyan.png",
          double.parse(load.startLat),
          double.parse(load.startLng),
          true));
      id++;
    }
    for (var device in devices) {
      markerItems.add(new MarkerItem(
          id,
          device.name,
          device.type,
          "assets/images/map_markers/truck/cyan.png",
          double.parse(locations[0].lat),
          double.parse(locations[0].lng),
          true));
      id++;
    }
    return markerItems;
  }

  // Creates all the markers
  void _createMarkers() {
    List<MarkerItem> markerItems = createAllMarkerItems();
    for (var item in markerItems) {
      // BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), item.icon).then((onValue) {
      //   setState(() {
      //     pinLocationIcon = onValue;
      //   });
      // });
      allMarkers.add(Marker(
          markerId: MarkerId(item.id.toString()),
          icon: BitmapDescriptor.fromAsset(item.icon),
          // icon: pinLocationIcon,
          draggable: true,
          position: LatLng(item.lat, item.lng),
          onTap: () {
            _selectedMarker = markerItems[item.id];
            log("Pressed marker " +
                _selectedMarker.id.toString() +
                ": " +
                _selectedMarker.title.toString());
          },
          infoWindow: InfoWindow(
              title: item.title,
              snippet: "Click for info",
              onTap: () {
                floatingPanelMap.open();
              })));
    }
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
          panel: ChangeNotifierProvider(
            create: (_) => new ChangeNotifier(),
            child: FloatingPanel()),
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
                  target: LatLng(
                      _startPosition.latitude, _startPosition.longitude),
                  zoom: 18.0,
                ),
                onMapCreated: (GoogleMapController controller) {},
                // Set the markers on the map
                markers: Set.from(allMarkers)),
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
