import 'package:port_tracker/domain/interfaces/i-readmodel.dart';
import 'package:port_tracker/domain/models/chat-message.dart';

class ChatListReadmodel extends IReadModel {
  Set<ChatMessage> _messages;

  Set<ChatMessage> get messages =>
      _messages == null || _messages.isEmpty ? Set() : _messages;

  void receiveMessage(ChatMessage message) {
    if (message == null) return;
    if (_messages == null) _messages = Set();

    _messages.add(message);
    notifyListeners();
  }
}
