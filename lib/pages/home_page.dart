import 'package:flutter/material.dart';

// import 'package:port_tracker/components/main_appbar.dart';
// import 'package:port_tracker/components/main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> info = [
    "This is the first tile of our homepage",
    "This is the second tile of our homepage",
    "This is the third tile of our homepage"
  ];

  List<String> tilenames = [
    "Info nieuwe ladingen",
    "Info over uw machine",
    "Info tile 3"
  ];

  List<IconData> icons = [
    Icons.view_quilt,
    Icons.local_shipping,
    Icons.visibility
  ];

  List<String> infoBoxes = [
    "Container NR-839",
    "Heftruck XF-398",
    "Tile3boxinfo"
  ];

  List<String> infoBoxesExtra = [
    "Locatie: Zone 8",
    "Speed: 23 km/u",
    "Extra: infoextrabox"
  ];

  Widget customcard(String tilename, String info, IconData iconIm, String infobox, String infoboxextra) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0, 
        horizontal: 15.0,
        ),
        child: InkWell(
          child: Material(
            color: Color(0x39B1C3).withOpacity(0.8),
            elevation: 10.0,
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: 300.0,
              width: 150.0,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      tilename,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
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
                                    iconIm,
                                    color: Colors.black,
                                    size: 65.0,
                                    semanticLabel: 'Logo fo shipping',
                                  ),
                                ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  infobox,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  infoboxextra,
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
                  ),
                  
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      info,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontFamily: "Roboto"
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                    ),
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
    return Scaffold(
      body: ListView(
        children: <Widget>[
          customcard(tilenames[0], info[0], icons[0], infoBoxes[0], infoBoxesExtra[0]),
          customcard(tilenames[1], info[1], icons[1], infoBoxes[1], infoBoxesExtra[1]),
          customcard(tilenames[2], info[2], icons[2], infoBoxes[2], infoBoxesExtra[2]),
        ],
      )
    );
  }
}
