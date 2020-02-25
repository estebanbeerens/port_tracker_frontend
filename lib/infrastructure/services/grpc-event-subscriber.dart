import 'dart:developer';

import 'package:grpc/grpc.dart';
import 'package:port_tracker/domain/events/base-event.dart';
import 'package:port_tracker/domain/interfaces/i-event-handler.dart';
import 'package:port_tracker/domain/interfaces/i-event-subscriber.dart';
import 'package:port_tracker/gen/event-service.pbgrpc.dart';

const EVENT_CENTRAL_IP = "51.124.68.52";
const EVENT_CENTRAL_PORT = 80;

class GrpcEventSubscriber implements IEventSubscriber {
  static GrpcEventSubscriber _instance = GrpcEventSubscriber._internal();
  factory GrpcEventSubscriber() => _instance;

  EventCentralClient _client;
  Map<Key, IEventHandler> _handlers;

  GrpcEventSubscriber._internal() {
    final channel = ClientChannel(
      EVENT_CENTRAL_IP,
      port: EVENT_CENTRAL_PORT,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _client = EventCentralClient(channel);
    _handlers = Map();
  }

  GrpcEventSubscriber._recreateFromCrash(Map<Key, IEventHandler> handlers) {
    final channel = ClientChannel(
      EVENT_CENTRAL_IP,
      port: EVENT_CENTRAL_PORT,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _client = EventCentralClient(channel);
    _handlers = handlers;
  }

  @override
  void addSubscriber(String topic, String action, IEventHandler handler) {
    final key = Key();

    key.topic = topic;
    key.action = action;

    _handlers.putIfAbsent(key, () => handler);
  }

  @override
  void listenForEvents() {
    final keys = _handlers.keys;

    final request = SubscribeRequest()..subscriptions.addAll(keys);

    final eventStream = _client.subscribe(request);

    eventStream.asBroadcastStream().listen(
      (event) {
        log("received event: events:${event.topic}:${event.action} [${event.id}]");
        _handlers.forEach((key, handler) {
          if (key.topic == event.topic && key.action == event.action) {
            final mapped = BaseEvent();
            mapped.id = event.id;
            mapped.topic = event.topic;
            mapped.action = event.action;
            mapped.metadata = event.metadata;
            mapped.payload = event.payload;

            handler.handle(mapped);

            key.lastId = event.id;
          }
        });
      },
      onError: (_) {
        Future.delayed(const Duration(seconds: 1), () {
          _instance = GrpcEventSubscriber._recreateFromCrash(_handlers);
          _instance.listenForEvents();
        });
      },
      cancelOnError: true,
    );
  }
}
