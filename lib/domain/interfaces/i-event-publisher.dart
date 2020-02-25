import 'package:port_tracker/domain/interfaces/i-event.dart';
import 'package:port_tracker/domain/interfaces/i-result.dart';

abstract class IEventPublisher {
  Future<IResult> publish(IEvent event);
}
