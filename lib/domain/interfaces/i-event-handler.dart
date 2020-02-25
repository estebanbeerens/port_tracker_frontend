import 'package:port_tracker/domain/interfaces/i-event.dart';

abstract class IEventHandler {
  void handle(IEvent event);
}
