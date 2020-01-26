import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadsPage extends StatefulWidget {
  @override
  _LoadsPageState createState() => _LoadsPageState();
}

class _LoadsPageState extends State<LoadsPage> {
  @override
  void initState() {
    super.initState();
    _initializeLoads();
  }

  Map<String, double> _namesDistances = Map();
  Map<String, Position> _loads = {
    "Lading 1": new Position(longitude: 4.968508, latitude: 51.157771),
    "Lading 2": new Position(longitude: 5.3547, latitude: 51.5376),
    "Lading 3": new Position(longitude: 4.757, latitude: 52.245),
    "Lading 4": new Position(longitude: 6.489, latitude: 52.954)
  };

  Future<void> _initializeLoads() async {
    Position current = await _getLocation();
    await _getDistances(current);
  }

  Future<Position> _getLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    return await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }


  Future<void> _getDistance(
      String name, Position position, Position currentPos) async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .distanceBetween(currentPos.latitude, currentPos.longitude,
            position.latitude, position.longitude)
        .then((double hoeweid) {
      setState(() {
        print(hoeweid);
        _namesDistances.putIfAbsent(name, () => hoeweid);
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _getDistances(Position currentPos) async {
    for (var load in _loads.keys) {
      await _getDistance(load, _loads[load], currentPos);
    }
  }

  Widget customcard(String name, Position pos) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 50.0,
      ),
      child: InkWell(
        onTap: () {
          //builder functie schrijven
        },
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          elevation: 10.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    child: Icon(
                      Icons.view_quilt,
                      color: Colors.black,
                      size: 65.0,
                      semanticLabel: 'Logo of shipping',
                    ),
                  ),
                ),
                Column(children: buildText(name)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildCustomCards() {
    return _loads.keys.map((key) => customcard(key, _loads[key])).toList();
  }

  List<Widget> buildText(String name) {
    List<Widget> textboit = List();
    textboit.add(Text(
      name,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
      ),
    ));

    if (_namesDistances[name].toString() == "null") {
      textboit.add(Text(
        "Calculating distance...",
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.black,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
      ));
    } else {
      textboit.add(Text(
        (_namesDistances[name]).toStringAsFixed(2) + " m",
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.black,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
      ));
    }
    return textboit;
  }

  @override
  Widget build(BuildContext context) {
    //_getLocation();
    return Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
        ),
        new ListView(
          children: buildCustomCards(),

          /*customcard(loads.keys[0].toString(), positions[0]),
            customcard(names[1], positions[1]),
            customcard(names[2], positions[2]),
            customcard(names[3], positions[3]),*/
          //customcard(tilenames[1], info[1], icons[1], infoBoxes[1], infoBoxesExtra[1]),
          //customcard(tilenames[2], info[2], icons[2], infoBoxes[2], infoBoxesExtra[2]),
        )
      ],
    ));
  }
}
