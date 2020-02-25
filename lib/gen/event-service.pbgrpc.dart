///
//  Generated code. Do not modify.
//  source: event-service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'event-service.pb.dart' as $0;
export 'event-service.pb.dart';

class EventOperatorClient extends $grpc.Client {
  static final _$publish = $grpc.ClientMethod<$0.Event, $0.DeliveryStatus>(
      '/eventstore.EventOperator/Publish',
      ($0.Event value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeliveryStatus.fromBuffer(value));

  EventOperatorClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.DeliveryStatus> publish($0.Event request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$publish, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class EventOperatorServiceBase extends $grpc.Service {
  $core.String get $name => 'eventstore.EventOperator';

  EventOperatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Event, $0.DeliveryStatus>(
        'Publish',
        publish_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Event.fromBuffer(value),
        ($0.DeliveryStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.DeliveryStatus> publish_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Event> request) async {
    return publish(call, await request);
  }

  $async.Future<$0.DeliveryStatus> publish(
      $grpc.ServiceCall call, $0.Event request);
}

class EventCentralClient extends $grpc.Client {
  static final _$subscribe = $grpc.ClientMethod<$0.SubscribeRequest, $0.Event>(
      '/eventstore.EventCentral/Subscribe',
      ($0.SubscribeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Event.fromBuffer(value));

  EventCentralClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.Event> subscribe($0.SubscribeRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$subscribe, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class EventCentralServiceBase extends $grpc.Service {
  $core.String get $name => 'eventstore.EventCentral';

  EventCentralServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubscribeRequest, $0.Event>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubscribeRequest.fromBuffer(value),
        ($0.Event value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Event> subscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.SubscribeRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Stream<$0.Event> subscribe(
      $grpc.ServiceCall call, $0.SubscribeRequest request);
}

class NotificationOperatorClient extends $grpc.Client {
  static final _$publish =
      $grpc.ClientMethod<$0.Notification, $0.DeliveryStatus>(
          '/eventstore.NotificationOperator/Publish',
          ($0.Notification value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeliveryStatus.fromBuffer(value));

  NotificationOperatorClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.DeliveryStatus> publish($0.Notification request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$publish, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class NotificationOperatorServiceBase extends $grpc.Service {
  $core.String get $name => 'eventstore.NotificationOperator';

  NotificationOperatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Notification, $0.DeliveryStatus>(
        'Publish',
        publish_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Notification.fromBuffer(value),
        ($0.DeliveryStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.DeliveryStatus> publish_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Notification> request) async {
    return publish(call, await request);
  }

  $async.Future<$0.DeliveryStatus> publish(
      $grpc.ServiceCall call, $0.Notification request);
}

class NotificationCentralClient extends $grpc.Client {
  static final _$subscribe =
      $grpc.ClientMethod<$0.SubscribeRequest, $0.Notification>(
          '/eventstore.NotificationCentral/Subscribe',
          ($0.SubscribeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Notification.fromBuffer(value));

  NotificationCentralClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.Notification> subscribe($0.SubscribeRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$subscribe, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class NotificationCentralServiceBase extends $grpc.Service {
  $core.String get $name => 'eventstore.NotificationCentral';

  NotificationCentralServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubscribeRequest, $0.Notification>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubscribeRequest.fromBuffer(value),
        ($0.Notification value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Notification> subscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.SubscribeRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Stream<$0.Notification> subscribe(
      $grpc.ServiceCall call, $0.SubscribeRequest request);
}
