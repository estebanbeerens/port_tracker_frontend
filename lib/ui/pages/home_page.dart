import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port_tracker/application/commands/chat/send-location.command.dart';
import 'package:port_tracker/domain/interfaces/i-command.dart';
import 'package:port_tracker/domain/interfaces/i-event-publisher.dart';
import 'package:port_tracker/functions/card_creator.dart';
import 'package:port_tracker/globals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IEventPublisher _publisher;

  void sendLocation() async {
    // activeUser = Provider.of<User>(context).username;

    ICommand sendLocationCommand =
        SendLocationCommand.build("0", "0", "5e416a48c66c312270310404", "5e43bbfb641d1acf076762a5");

    _publisher.publish(sendLocationCommand.execute());
  }

  createCards() {
    if (currentDevice != null) {
      return new ListView(children: createCurrentDeviceCard() + createCurrentLoadsCards());
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
            MaterialButton(
              child: Text("TEST ME HERE"),
              onPressed: () {
                 sendLocation();
              }),
            createCards()
        ]
      )
    );
  }
}
