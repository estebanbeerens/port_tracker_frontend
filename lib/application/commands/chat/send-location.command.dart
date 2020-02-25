import 'package:port_tracker/application/events/chat/send-location.event.dart';
import 'package:port_tracker/domain/interfaces/i-command.dart';
import 'package:port_tracker/domain/interfaces/i-event.dart';

class SendLocationCommand implements ICommand {
  // private constructor
  SendLocationCommand._(this._latitude, this._longtitude, this._deviceId, this._accountId);

  factory SendLocationCommand.build(String latitude, String longtitude, String deviceId, String accountId) {
    return SendLocationCommand._(latitude, longtitude, deviceId, accountId);
  }

  String _latitude;
  String _longtitude;
  String _deviceId;
  String _accountId;

  IEvent execute() {
    // if (this._message.isEmpty) return null;

    return SendChatEvent.build(
      SendLocationEventPayload(latitude: this._latitude, longtitude: this._longtitude, deviceId: this._deviceId, accountId: this._accountId),
    );
  }
}
