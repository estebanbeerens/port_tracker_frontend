import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:port_tracker/functions/device.dart';
import 'package:port_tracker/models/device.dart';

class QrPage extends StatefulWidget{
  _QrPageState createState()=> _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String result = "Scan your QR";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        scannedQR = qrResult;
      });
    }
    on PlatformException
    catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          scannedQR = "Unknown Error $ex";
        });
      }
    }
    on FormatException {
      setState(() {
        scannedQR = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        scannedQR = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/background.png'),
                fit: BoxFit.cover
              ),
            ),
          ),
          new Center(
           child: new Text(result, style: new TextStyle(fontSize: 35.0),),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        backgroundColor: Color(0x39B1C3).withOpacity(1.0),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}