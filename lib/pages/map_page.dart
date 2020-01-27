import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


//Let's define a DrawerItem data object
class MarkerItem {
  String title;
  String icon;
  double lat;
  double lng;
  MarkerItem(this.title, this.icon, this.lat, this.lng);
}

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Position _currentPosition;

  final markerItems = [
    new MarkerItem("Truck 1", "assets/images/map_markers/truck/cyan.png", 51.158315, 4.967445),
    new MarkerItem("Load 1", "assets/images/map_markers/load/red.png", 51.158401, 4.968479),
    new MarkerItem("Load 2", "assets/images/map_markers/load/cyan.png", 51.157959, 4.961615),
  ];
  
  List<Marker> allMarkers = [];
  BitmapDescriptor pinLocationIcon;

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
  
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

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

  void _createMarkers() {
    for(var item in markerItems) {
      // BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), item.icon).then((onValue) {
      //   setState(() {
      //     pinLocationIcon = onValue;
      //   });
      // });
      allMarkers.add(
        Marker(
          markerId: MarkerId(item.title),
          icon: BitmapDescriptor.fromAsset(item.icon),
          // icon: pinLocationIcon,
          draggable: true,
          position: LatLng(item.lat, item.lng)
        )
      );
    }
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Icon(Icons.drag_handle),
      ),
    );
  }

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
        child: Text("This is the SlidingUpPanel when open"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPosition == null) {    
      return Scaffold(
        body: Container(
          child: Center(
            child: Loading(indicator: BallGridPulseIndicator(), size: 100.0,color: Color(0x39B1C3).withOpacity(0.9)),
          ),
      ),
    );
    } else {
      return Scaffold(
        body: new SlidingUpPanel(
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: Center(
            child: GoogleMap(
              compassEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              buildingsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                zoom: 18.0,
              ),
              onMapCreated: (GoogleMapController controller) {},
              markers: Set.from(allMarkers)
            ),
          ),
          backdropEnabled: true,
          backdropOpacity: 0.2,
          minHeight: 90,
          borderRadius: radius,
          ),
      );
    }
  }
}