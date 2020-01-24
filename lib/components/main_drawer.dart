import 'package:port_tracker/components/fragments.dart' as Fragments;
import 'package:flutter/material.dart';
import 'package:port_tracker/pages/login_page.dart';
import 'package:port_tracker/services/auth_service.dart';

//Let's define a DrawerItem data object
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

// Our Homepage
class MainDrawer extends StatefulWidget {
  //Let's define our drawer items, strings and images
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Map", Icons.map),
    new DrawerItem("QR Scanner", Icons.grid_on),
    new DrawerItem("Settings", Icons.settings)
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
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    //Let's scaffold our homepage
    return new Scaffold(
      appBar: new AppBar(
        // We will dynamically display title of selected page
        centerTitle: true,
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title, style: TextStyle(color: Colors.black)),
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
              accountName: new Text("Dries Bierens"),
              accountEmail: new Text("Worthless back-end developer"),
              currentAccountPicture: new CircleAvatar(backgroundImage:
                new NetworkImage("https://scontent-bru2-1.xx.fbcdn.net/v/t1.15752-9/83885531_202781944228102_8149592996963155968_n.jpg?_nc_cat=109&_nc_ohc=e2IDL9GbNWEAX9LhbfD&_nc_ht=scontent-bru2-1.xx&oh=14b7390dc601f596b71beeabefdbe7bc&oe=5ED14861"),),
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
            new Divider(),
            new ListTile(
                leading: new Icon(Icons.grid_off),
                title: new Text("Log out of device"),
                enabled: false
            ),
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text("Log Out"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "LoginPage"),
                      builder: (BuildContext context) => LoginPage()),
                );
              },
            ),
          ],   
        ),
      ),
      body: _getDrawerFragment(_selectedDrawerIndex),
    );
  }
}
