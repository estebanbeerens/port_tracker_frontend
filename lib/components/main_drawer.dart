import 'package:port_tracker/components/fragments.dart' as Fragments;
import 'package:flutter/material.dart';
import 'package:port_tracker/pages/login_page.dart';
import 'package:port_tracker/services/auth_service.dart';

//Let's define a DrawerItem data object
class DrawerItem {
  String title;
  IconData icon;
  bool enabled;
  DrawerItem(this.title, this.icon, this.enabled);
}

// Our Homepage
class MainDrawer extends StatefulWidget {
  //Let's define our drawer items, strings and images
  final drawerItems = [
    new DrawerItem("Home", Icons.home, true),
    new DrawerItem("Map", Icons.map, true),
    new DrawerItem("QR Scanner", Icons.grid_on, true),
    new DrawerItem("Nieuwe ladingen", Icons.settings_input_component, true),
    new DrawerItem("Settings", Icons.settings, true)
  ];
  //Let's Create and Return state for this 'StatefulWidget'
  @override
  State<StatefulWidget> createState() {
    return new MainDrawerState();
  }
}

// Let's define state for our homepage. A state is just information for a widget.
class MainDrawerState extends State<MainDrawer> {
  int _selectedDrawerIndex = 0;

  //Let's use a switch statement to return the Fragment for a selected item
  _getDrawerFragment(int pos) {
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
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
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
            Text(widget.drawerItems[_selectedDrawerIndex].title, style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'))
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
              accountName: new Text("Tyrone Jackson", style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              accountEmail: new Text("Truck driver", style: TextStyle(fontFamily: 'Montserrat')),
              currentAccountPicture: new CircleAvatar(backgroundImage:
                new NetworkImage("https://c.pxhere.com/images/0f/3f/4dbc54d34a6b984a6c5f283be804-1447673.jpg!d"),),
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
            new ListTile(
              leading: new Icon(Icons.grid_off),
              title: new Text("Log out of device", style: TextStyle(fontFamily: 'Montserrat')),
              enabled: false
            ),
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text("Log Out", style: TextStyle(fontFamily: 'Montserrat')),
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
