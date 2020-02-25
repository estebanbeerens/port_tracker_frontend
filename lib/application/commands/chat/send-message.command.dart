import 'package:port_tracker/application/events/chat/send-chat.event.dart';
import 'package:port_tracker/domain/interfaces/i-command.dart';
import 'package:port_tracker/domain/interfaces/i-event.dart';

class SendMessageCommand implements ICommand {
  // private constructor
  SendMessageCommand._(this._user, this._message);

  factory SendMessageCommand.build(String user, String message) {
    return SendMessageCommand._(user, message);
  }

  String _message;
  String _user;

  IEvent execute() {
    if (this._message.isEmpty) return null;

    return SendChatEvent.build(
      SendChatEventPayload(user: this._user, message: this._message),
    );
  }
}
