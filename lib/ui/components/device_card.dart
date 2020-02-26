import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port_tracker/models/device.dart';
import 'package:port_tracker/ui/navigation/main_drawer.dart';
import 'package:port_tracker/ui/styles/text_style.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  DeviceCard(this.device);

  @override
  _DeviceCardState createState() => _DeviceCardState(this.device);
}

class _DeviceCardState extends State<DeviceCard> {
  Device device;
  _DeviceCardState(this.device);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: new Stack(
        children: <Widget>[
          // The card with text on it several things can be displayed here
          new Container(
            child: new Container(
              margin: new EdgeInsets.only(
                  left: 76.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(height: 4.0),
                  // Title
                  new Text(device.name, style: Style.titleTextStyle),
                  new Container(height: 10.0),
                  // Description / Company
                  new Text(device.type, style: Style.commonTextStyle),
                  // The divider
                  new Container(
                      margin: new EdgeInsets.symmetric(vertical: 8.0),
                      height: 2.0,
                      width: 36.0,
                      color: Color(0xF03B8E).withOpacity(1.0)),
                    new Row(children: <Widget>[
                      new Expanded(
                          child: new MaterialButton(
                              child: new Row(
                                children: <Widget>[
                                  Icon(Icons.my_location),
                                  new Container(width: 8.0),
                                  Text("Go to your location")
                                ],
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      settings: RouteSettings(name: "MapPage"),
                                      builder: (BuildContext context) =>
                                          MainDrawer(1, null)),
                                );
                              }))
                    ]),
                ]
              )
            ),
              margin: new EdgeInsets.only(left: 46.0),
              decoration: new BoxDecoration(
                color: new Color(0x39B1C3).withOpacity(0.6),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 10.0),
                  ),
                ],
              ),
            ),
          // The thumbnail for the card, AKA the icon in the circle on the left of the card
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 16.0),
              alignment: FractionalOffset.centerLeft,
              child: new ClipOval(
                child: Container(
                  color: Color(0xFFFFFF).withOpacity(1),
                  height: 97.0,
                  width: 97.0,
                  child: Center(
                    // Custom icon goes here
                    child: Icon(Icons.local_shipping, size: 80.0, color: Color(0x333333).withOpacity(1)),
                  ),
                ),
              ))
        ]
      )
    );
  }
}