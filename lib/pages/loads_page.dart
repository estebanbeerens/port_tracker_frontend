import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadsPage extends StatefulWidget {
  @override
  _LoadsPageState createState() => _LoadsPageState();
}

class _LoadsPageState extends State<LoadsPage> {
  Position _currentPosition;
  List<String> names = ["Lading 1", "Lading 2", "Lading 3", "Lading 4"];

  List<Position> positions = [
    new Position(longitude: 51.157771, latitude: 4.968508),
    new Position(longitude: 51.5376, latitude: 5.3547),
    new Position(longitude: 52.245, latitude: 4.757),
    new Position(longitude: 52.954, latitude: 6.489)
  ];

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

  Future<double> _getDistance(Position position) async {
    double distance = await Geolocator().distanceBetween(_currentPosition.latitude,
        _currentPosition.longitude, position.latitude, position.longitude);
    print(distance);
    return distance;
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
                Column(
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      _getDistance(pos).toString(),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _getLocation();
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
          children: <Widget>[
            customcard(names[0], positions[0]),
            customcard(names[1], positions[1]),
            customcard(names[2], positions[2]),
            customcard(names[3], positions[3]),
            //customcard(tilenames[1], info[1], icons[1], infoBoxes[1], infoBoxesExtra[1]),
            //customcard(tilenames[2], info[2], icons[2], infoBoxes[2], infoBoxesExtra[2]),
          ],
        )
      ],
    ));
  }
}
