import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:port_tracker/functions/json_helper.dart';
import 'package:port_tracker/functions/upcon_user.dart';
import 'package:port_tracker/functions/send_location.dart';
import 'package:port_tracker/globals.dart';
import 'package:port_tracker/models/device.dart';
import 'package:port_tracker/models/load.dart';
import 'package:port_tracker/ui/components/toast.dart';
import 'package:port_tracker/ui/navigation/fragments.dart' as Fragments;
import 'package:flutter/material.dart';
import 'package:port_tracker/models/drawer_item.dart';
import 'package:port_tracker/ui/pages/login_page.dart';

// Our main container
class MainDrawer extends StatefulWidget {
  final int _selectedDrawerIndex;
  final Position _selectedMarkerPosition;
  MainDrawer(this._selectedDrawerIndex, this._selectedMarkerPosition);

  @override
  State<StatefulWidget> createState() {
    return new MainDrawerState(_selectedDrawerIndex, _selectedMarkerPosition);
  }
}

// Let's define state for our homepage. A state is just information for a widget.
class MainDrawerState extends State<MainDrawer> {
  int _selectedDrawerIndex;
  Position _selectedMarkerPosition;
  MainDrawerState(this._selectedDrawerIndex, this._selectedMarkerPosition);

  String imagePath;
  String role;
  List<DrawerItem> drawerList;
  ListTile logOutOfDeviceTile;
  ListTile qrScannerTile;

  @override
  void initState() {
    super.initState();
    _checkIfAdmin();
  }

  
  void setDeviceNull() {
    logoutOfDevice();
    setState(() {
      currentDevice = null;
    });
  }

  Future<void> scanQR() async {
    try {
      String scannedQR = await BarcodeScanner.scan();
      String deviceJson = await getDeviceJson("http://www.port-tracker.tk:8000/api/devices/" + scannedQR);
      startLocationTracking(true);
      setState(() {
        scanResult = "QR-code scan succesful";
        currentDevice = jsonToDevice(deviceJson);
      });
      loginToDevice();
      for (Load load in currentDevice.loads) {
        setState(() {
          currentLoads.add(jsonToLoad(load.toString()));
        });
      }
    }
    on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          scanResult = "Camera permission was denied";
        });
      } else {
        setState(() {
          scanResult = "Unknown Error $ex";
        });
      }
    }
    on FormatException {
      setState(() {
        scanResult = "You pressed the back button before scanning anything";
      });
    } 
    catch (ex) {
      setState(() {
        scanResult = "Unknown Error $ex";
      });
    }
  }

  _checkIfAdmin() {
    if (loggedInAccount.isModerator == true) {
      imagePath = "assets/images/admin.png";
      drawerList = drawerItemsModerator;
      logOutOfDeviceTile = ListTile();
      qrScannerTile = ListTile();
    } else {
      imagePath = "assets/images/worker.png";
      drawerList = drawerItemsUser;
      qrScannerTile = ListTile(
        leading: new Icon(Icons.grid_on),
        title: new Text("QR scanner", style: TextStyle(fontFamily: 'Montserrat')),
        enabled: true,
        onTap: () async {
          Navigator.of(context).pop();
          await scanQR();
        },
      );
      logOutOfDeviceTile = ListTile(
        leading: Icon(Icons.grid_off),
        title: Text("Log out of device", style: TextStyle(fontFamily: 'Montserrat')),
        enabled: true,
        onTap: () {
          Navigator.of(context).pop();
          if (currentDevice != null) {
            setDeviceNull();
            startLocationTracking(false);
            createToast("Logged out of device", Colors.black54);
          } else {
            createToast("You aren't logged in to a device", Colors.black54);
          }
        },
      );
    }
    if (loggedInAccount.roles == null) {
      role = "No role assigned";
    } else {
      role = loggedInAccount.roles[0];
    }
  }

  //Let's use a switch statement to return the Fragment for a selected item
  _getDrawerFragment(int pos) {
    if (loggedInAccount.isModerator == true) {
      switch (pos) {
        case 0:
          return new Fragments.Home();
        case 1:
          return new Fragments.Map(_selectedMarkerPosition);
        case 2:
          return new Fragments.Machines();
        case 3:
          return new Fragments.Loads();

        default:
          return new Text("Error");
      }
    } else {
      switch (pos) {
        case 0:
          return new Fragments.Home();
        case 1:
          return new Fragments.Map(_selectedMarkerPosition);
        case 2:
          return new Fragments.Loads();

        default:
          return new Text("Error");
      }
    }
  }

  //Let's update the selectedDrawerItemIndex the close the drawer
  _onSelectItem(int index) {
    if (index == 1) {
      _selectedMarkerPosition = null;
    }
    setState(() => _selectedDrawerIndex = index);
    //we close the drawer
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    //Let's create drawer list items. Each will have an icon and text
    for (var i = 0; i < drawerList.length; i++) {
      var d = drawerList[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title, style: TextStyle(fontFamily: 'Montserrat')),
        enabled: d.enabled,
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    //Let's scaffold our page
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        // We will dynamically display title of selected page
        title: new Row(
          children: <Widget>[
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: new AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                ))),
            Text(drawerList[_selectedDrawerIndex].title,
                style: TextStyle(
                    // color: Colors.black,
                    fontFamily: 'Montserrat'))
          ],
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        // elevation: 0.0
      ),
      // Let's register our Drawer to the Scaffold
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            //Lets Create a material design drawer header with account name, email,avatar
            new UserAccountsDrawerHeader(
              accountName: new Text(
                  loggedInAccount.firstName + " " + loggedInAccount.lastName,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              accountEmail:
                  new Text(role, style: TextStyle(fontFamily: 'Montserrat')),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage(imagePath),
              ),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topCenter,
                    colors: [
                      Color(0x39B1C3).withOpacity(0.0),
                      Color(0x39B1C3).withOpacity(1.0),
                    ]),
              ),
            ),
            new Column(children: drawerOptions),
            qrScannerTile,
            new Expanded(child: new Align()),
            logOutOfDeviceTile,
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text("Log out",
                  style: TextStyle(fontFamily: 'Montserrat')),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "LoginPage"),
                      builder: (BuildContext context) => LoginPage()),
                );
              },
            ),
            new Padding(padding: EdgeInsets.symmetric(vertical: 10.0))
          ],
        ),
      ),
      body: _getDrawerFragment(_selectedDrawerIndex),
    );
  }
}