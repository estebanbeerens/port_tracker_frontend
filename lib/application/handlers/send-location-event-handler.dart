import 'package:port_tracker/application/events/chat/send-location.event.dart';
import 'package:port_tracker/domain/interfaces/i-event-handler.dart';
import 'package:port_tracker/domain/interfaces/i-event.dart';
import 'package:port_tracker/domain/models/chat-message.dart';
import 'package:port_tracker/application/shared-state/chat/location-list-readmodel.state.dart';

class SendLocationEventHandler implements IEventHandler {
  LocationListReadmodel _chatListReadmodel;

  SendLocationEventHandler(LocationListReadmodel chatListReadmodel) {
    _chatListReadmodel = chatListReadmodel;
  }

  void handle(IEvent event) {
    final payload = SendLocationEventPayload.fromRawJson(event.payload);
    final location = Position(latitude: payload.latitude, longtitude: payload.longtitude, deviceId: payload.deviceId, accountId: payload.accountId);

    _chatListReadmodel.receivePosition(location);
  }
}
