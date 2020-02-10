import 'package:flutter/material.dart';
import 'package:port_tracker/models/marker_item.dart';

// Parent file for floating_panel.dart and map_page.dart

class MarkerSelector with ChangeNotifier {
  MarkerItem _selectedMarker;
  MarkerSelector();

  getSelectedMarker() => _selectedMarker;

  set setMarker(MarkerItem selectedMarker) {
    _selectedMarker = selectedMarker;
    notifyListeners();
  }
}