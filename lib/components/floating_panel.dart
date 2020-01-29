import 'package:flutter/material.dart';
import 'package:port_tracker/marker_selector.dart';
import 'package:provider/provider.dart';

class FloatingPanel extends StatefulWidget {
  @override
  _FloatingPanelState createState() => _FloatingPanelState();
}

// The floating panel when it's opened
class _FloatingPanelState extends State<FloatingPanel> {

  @override
  Widget build(BuildContext context) {
    return Consumer<MarkerSelector>(
      builder: (context, selectedMarker, _) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
        ),
        margin: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(selectedMarker.toString())
        ),
      )
    );
  }
}