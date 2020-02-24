import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port_tracker/globals.dart';

class FloatingPanel extends StatefulWidget {
  @override
  _FloatingPanelState createState() => _FloatingPanelState();
}

// The floating panel for the map when it's opened
class _FloatingPanelState extends State<FloatingPanel> {
  createFloatingPanel() {
    if (currentDevice != null) {
      if (selectedLoad != null) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selectedLoad.name,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold)),
              SizedBox(height: ScreenUtil.getInstance().setHeight(10)),
              Text(selectedLoad.firm,
                  style: TextStyle(fontSize: 16.0, fontFamily: "Roboto")),
              SizedBox(height: ScreenUtil.getInstance().setHeight(10)),
              // The divider
              new Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 36.0,
                  color: Colors.black),
              SizedBox(height: ScreenUtil.getInstance().setHeight(10)),
              Text(selectedLoad.description,
                  style: TextStyle(fontSize: 14.0, fontFamily: "Roboto")),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Mark as done:"),
                  new Container(width: 20.0),
                  Checkbox(
                    value: selectedLoad.finished,
                    activeColor: Colors.green,
                    onChanged: (bool value) {
                      setState(() {
                        selectedLoad.finished = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        return new Center(
          child: Text("No Marker selected",
              style: TextStyle(fontSize: 18.0, fontFamily: "Montserrat")));
      }
      } else {
        return new Center(
          child: Text("No QR Code scanned",
              style: TextStyle(fontSize: 18.0, fontFamily: "Montserrat")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.all(24.0),
      child: Container(child: createFloatingPanel()),
    );
  }
}
