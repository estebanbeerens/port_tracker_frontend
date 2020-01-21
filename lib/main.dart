import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Port Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Port Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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

  //List<String> images

  Widget customcard(String tilename, String info, IconData iconIm, String infobox, String infoboxextra) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0, 
        horizontal: 15.0,
        ),
        child: InkWell(
          child: Material(
            color: Color.fromRGBO(57, 177, 195, 1),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          customcard(tilenames[0], info[0], icons[0], infoBoxes[0], infoBoxesExtra[0]),
          customcard(tilenames[1], info[1], icons[1], infoBoxes[1], infoBoxesExtra[1]),
          customcard(tilenames[2], info[2], icons[2], infoBoxes[2], infoBoxesExtra[2]),
        ],
      ),
    );
  }
}
