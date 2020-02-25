import 'package:port_tracker/domain/interfaces/i-readmodel.dart';
import 'package:port_tracker/domain/models/chat-message.dart';

class LocationListReadmodel extends IReadModel {
  Set<Position> _positions;

  Set<Position> get messages =>
      _positions == null || _positions.isEmpty ? Set() : _positions;

  void receivePosition(Position position) {
    if (position == null) return;
    if (_positions == null) _positions = Set();

    _positions.add(position);
    notifyListeners();
  }
}
