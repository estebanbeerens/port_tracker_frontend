import 'package:port_tracker/application/shared-state/chat/chat-list-readmodel.state.dart';
import 'package:port_tracker/application/shared-state/login/user.state.dart';
import 'package:port_tracker/domain/interfaces/i-readmodel.dart';

class AppState extends IReadModel {
  bool initialised;
  User activeUser;
  ChatListReadmodel chatList;

  AppState() {
    initialised = false;
    activeUser = User();
    chatList = ChatListReadmodel();
  }

  initialisationFinished() {
    initialised = true;
  }
}
