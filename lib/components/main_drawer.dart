import 'package:port_tracker/components/fragments.dart' as Fragments;
import 'package:flutter/material.dart';
import 'package:port_tracker/mock/drawer_item_mock.dart';
import 'package:port_tracker/mock/user_item_mock.dart';
import 'package:port_tracker/models/drawer_item.dart';
import 'package:port_tracker/models/user.dart';
import 'package:port_tracker/pages/login_page.dart';

// Our main container
class MainDrawer extends StatefulWidget {
  //Let's define our drawer items, strings and images
  //Let's Create and Return state for this 'StatefulWidget'
  @override
  State<StatefulWidget> createState() {
    return new MainDrawerState();
  }
}

// Let's define state for our homepage. A state is just information for a widget.
class MainDrawerState extends State<MainDrawer> {
  int _selectedDrawerIndex = 0;

  bool isModerator = true;
  List<DrawerItem> drawerList;
  User loggedInUser;
  ListTile logOutOfDeviceTile;

  @override
  void initState() {
    super.initState();
    if (isModerator == true) {
      loggedInUser = users[1];
      drawerList = drawerItemsModerator;
      logOutOfDeviceTile = ListTile();
    } else {
      loggedInUser = users[0];
      drawerList = drawerItemsUser;
      logOutOfDeviceTile = ListTile(
        leading: Icon(Icons.grid_off),
        title: Text("Log out of device", style: TextStyle(fontFamily: 'Montserrat')),
        enabled: false
      );
    }
  }

  //Let's use a switch statement to return the Fragment for a selected item
  _getDrawerFragment(int pos) {
    if(isModerator == true) {
      switch (pos) {
        case 0:
          return new Fragments.Home();
        case 1:
          return new Fragments.Map();
        case 2:
          return new Fragments.Machines();
        case 3:
          return new Fragments.Loads();
        case 4:
          return new Fragments.Accidents();
        case 5:
          return new Fragments.Settings();

        default:
          return new Text("Error");
      }
    } else {
      switch (pos) {
        case 0:
          return new Fragments.Home();
        case 1:
          return new Fragments.Map();
        case 2:
          return new Fragments.Qr();
        case 3:
          return new Fragments.Loads();
        case 4:
          return new Fragments.Settings();

        default:
          return new Text("Error");
      }
    }
  }

  //Let's update the selectedDrawerItemIndex the close the drawer
  _onSelectItem(int index) {
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
    //Let's scaffold our homepage
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
                  )
                )
              ),
            Text(drawerList[_selectedDrawerIndex].title, style: TextStyle(
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
              accountName: new Text(loggedInUser.firstName + " " + loggedInUser.lastName, style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              accountEmail: new Text(loggedInUser.role, style: TextStyle(fontFamily: 'Montserrat')),
              currentAccountPicture: new CircleAvatar(backgroundImage:
                new NetworkImage(loggedInUser.imagePath),),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topCenter,
                  colors: [
                    Color(0x39B1C3).withOpacity(0.0),
                    Color(0x39B1C3).withOpacity(1.0),
                  ]
                ),
              ),
            ),
            new Column(children: drawerOptions),
            // new Divider(),
            new Expanded(child: new Align()),
            logOutOfDeviceTile,
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text("Log out", style: TextStyle(fontFamily: 'Montserrat')),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "LoginPage"),
                      builder: (BuildContext context) => LoginPage()),
                );
              },
            ),
            new Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0
              )
            )
          ],   
        ),
      ),
      body: _getDrawerFragment(_selectedDrawerIndex),
    );
  }
}
