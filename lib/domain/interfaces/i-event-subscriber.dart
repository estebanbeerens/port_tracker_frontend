import 'package:port_tracker/domain/interfaces/i-event-handler.dart';

abstract class IEventSubscriber {
  void listenForEvents();
  void addSubscriber(String topic, String action, IEventHandler handler);
}
