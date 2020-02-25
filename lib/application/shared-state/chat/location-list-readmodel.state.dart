import 'package:port_tracker/domain/interfaces/i-readmodel.dart';
import 'package:port_tracker/models/location.dart';

class LocationListReadmodel extends IReadModel {
  Set<Location> _locations;

  Set<Location> get messages =>
      _locations == null || _locations.isEmpty ? Set() : _locations;

  void receivePosition(Location location) {
    if (location == null) return;
    if (_locations == null) _locations = Set();

    _locations.add(location);
    notifyListeners();
  }
}
