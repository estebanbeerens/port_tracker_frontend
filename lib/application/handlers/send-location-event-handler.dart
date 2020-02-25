import 'package:port_tracker/application/events/location/send-location.event.dart';
import 'package:port_tracker/domain/interfaces/i-event-handler.dart';
import 'package:port_tracker/domain/interfaces/i-event.dart';
import 'package:port_tracker/application/shared-state/chat/location-list-readmodel.state.dart';
import 'package:port_tracker/models/location.dart';

class SendLocationEventHandler implements IEventHandler {
  LocationListReadmodel _chatListReadmodel;

  SendLocationEventHandler(LocationListReadmodel chatListReadmodel) {
    _chatListReadmodel = chatListReadmodel;
  }

  void handle(IEvent event) {
    final payload = SendLocationEventPayload.fromRawJson(event.payload);
    final location = Location(payload.latitude, payload.longitude, payload.deviceId, payload.accountId);

    _chatListReadmodel.receivePosition(location);
  }
}
