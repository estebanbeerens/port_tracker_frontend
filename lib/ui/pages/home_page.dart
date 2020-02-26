import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port_tracker/functions/card_creator.dart';
import 'package:port_tracker/globals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  createCards() {
    if (currentDevice != null) {
      return new ListView(children: createCurrentDeviceCard() + createUnfinshedCurrentLoadsCards());
    } else {
      return new Center( child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No QR Code scanned", style: TextStyle(fontSize: 20.0, fontFamily: "Montserrat")),
          SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
          MaterialButton(child: Text("Open navigation", style: TextStyle(fontSize: 14.0, fontFamily: "Montserrat"),), color: Color(0x39B1C3).withOpacity(0.6), onPressed: () { Scaffold.of(context).openDrawer(); })
        ]
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover))),
            
            createCards()
        ]
      )
    );
  }
}