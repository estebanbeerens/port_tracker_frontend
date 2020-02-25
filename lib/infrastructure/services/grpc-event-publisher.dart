import 'package:grpc/grpc.dart';
import 'package:port_tracker/domain/interfaces/i-event-publisher.dart';
import 'package:port_tracker/domain/interfaces/i-event.dart';
import 'package:port_tracker/domain/interfaces/i-result.dart';
import 'package:port_tracker/domain/models/delivery-status-result.dart';
import 'package:port_tracker/gen/event-service.pbgrpc.dart';

const EVENT_OPERATOR_IP = "51.124.4.231";
const EVENT_OPERATOR_PORT = 80;

class GrpcEventPublisher extends IEventPublisher {
  static final GrpcEventPublisher _instance = GrpcEventPublisher._internal();
  factory GrpcEventPublisher() => _instance;

  EventOperatorClient _client;

  GrpcEventPublisher._internal() {
    final channel = ClientChannel(
      EVENT_OPERATOR_IP,
      port: EVENT_OPERATOR_PORT,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _client = EventOperatorClient(channel,
        options: CallOptions(timeout: Duration(seconds: 5)));
  }

  Future<IResult> publish(IEvent event) async {
    if (event == null) return Future.value(DeliveryStatusResult(false, ""));

    final mapped = Event();
    mapped.topic = event.topic;
    mapped.action = event.action;
    if (event.metadata != null) mapped.metadata.addAll(event.metadata);
    mapped.payload = event.payload;

    final result = await _client.publish(mapped);

    return Future.value(DeliveryStatusResult(result.success, result.id));
  }
}
