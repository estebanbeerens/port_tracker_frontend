import 'package:flutter/material.dart';
import 'package:port_tracker/ui/styles/text_style.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0
      ),
      child: new Stack(
        children: <Widget>[
          homeCard,
          homeTumbnail
      ],
      )
    );
  }
}

final homeCard = new Container(
  child: new Container(
  margin: new EdgeInsets.only(
    left: 76.0, 
    right: 16.0, 
    top: 16.0,
    bottom: 16.0
    ),
  constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height: 4.0),
      new Text("5 ton coke", style: Style.titleTextStyle),
      new Container(height: 10.0),
      new Text("VZW Gran Colombia", style: Style.commonTextStyle),    
      new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 36.0,
        color: Color(0xF03B8E).withOpacity(1.0)
      ),
      new Row(
        children: <Widget>[
          new Expanded(
            flex: 0,
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.location_searching, color: Colors.black,),
                new Container(width: 8.0),
                new Text("500 m")
              ]
            ),
          )
        ],
      ),
    ],
  ),
  ),
  height: 129.0,
  margin: new EdgeInsets.only(left: 46.0),
  decoration: new BoxDecoration(
    color: new Color(0x39B1C3).withOpacity(0.6),
    shape: BoxShape.rectangle,
    borderRadius: new BorderRadius.circular(8.0),
    boxShadow: <BoxShadow>[
      new BoxShadow(  
        color: Colors.black12,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
      ),
    ],
  ),
);

final homeTumbnail = new Container(
  margin: new EdgeInsets.symmetric(
    vertical: 16.0
  ),
  alignment: FractionalOffset.centerLeft,
  child: 
    new ClipOval(
      child: Container(
        color: Color(0xFFFFFF).withOpacity(1),
        height: 97.0,
        width: 97.0,
        child: Center(
          child: Icon(Icons.dashboard, size: 80.0, color: Color(0x333333).withOpacity(1)),
        ),
      ),
    )
);