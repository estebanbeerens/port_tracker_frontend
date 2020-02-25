import 'package:port_tracker/application/events/location/send-location.event.dart';
import 'package:port_tracker/domain/interfaces/i-command.dart';
import 'package:port_tracker/domain/interfaces/i-event.dart';

class SendLocationCommand implements ICommand {
  // private constructor
  SendLocationCommand._(this._latitude, this._longitude, this._deviceId, this._accountId);

  factory SendLocationCommand.build(String latitude, String longitude, String deviceId, String accountId) {
    return SendLocationCommand._(latitude, longitude, deviceId, accountId);
  }

  String _latitude;
  String _longitude;
  String _deviceId;
  String _accountId;

  IEvent execute() {
    // if (this._message.isEmpty) return null;

    return SendLocationEvent.build(
      SendLocationEventPayload(latitude: this._latitude, longitude: this._longitude, deviceId: this._deviceId, accountId: this._accountId),
    );
  }
}
