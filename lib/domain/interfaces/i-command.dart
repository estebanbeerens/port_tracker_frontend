import 'package:port_tracker/domain/interfaces/i-event.dart';

abstract class ICommand {
  IEvent execute();
}
