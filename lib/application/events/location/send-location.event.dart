import 'dart:convert';

import 'package:port_tracker/domain/events/base-event.dart';
import 'package:port_tracker/domain/interfaces/i-payload.dart';

class SendLocationEventPayload implements IPayload {
  SendLocationEventPayload({this.latitude, this.longitude, this.deviceId, this.accountId});

  String latitude;
  String longitude;
  String deviceId;
  String accountId;

  @override
  String toJson() {
    return jsonEncode({"Latitude": this.latitude, "Longitude": this.longitude, "DeviceId": this.deviceId, "AccountId": this.accountId});
  }

  factory SendLocationEventPayload.fromRawJson(String str) =>
      SendLocationEventPayload.fromJson(json.decode(str));

  factory SendLocationEventPayload.fromJson(Map<String, dynamic> json) =>
      SendLocationEventPayload(
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        deviceId: json["DeviceId"],
        accountId: json["AccountId"],
      );
}

class SendLocationEvent extends BaseEvent {
  SendLocationEvent._({this.payload, this.metadata});

  factory SendLocationEvent.build(SendLocationEventPayload payload,
      [Map<String, String> metadata]) {
    return SendLocationEvent._(payload: payload.toJson(), metadata: metadata);
  }

  static Map<String, String> get stream => {
        "key": "events",
        "topic": "location",
        "action": "insert",
      };

  @override
  String get topic => SendLocationEvent.stream["topic"];
  @override
  String get action => SendLocationEvent.stream["action"];

  @override
  Map<String, String> metadata;

  @override
  String payload;
}
