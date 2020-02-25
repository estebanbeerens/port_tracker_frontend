import 'dart:convert';

import 'package:port_tracker/domain/events/base-event.dart';
import 'package:port_tracker/domain/interfaces/i-payload.dart';

class SendLocationEventPayload implements IPayload {
  SendLocationEventPayload({this.latitude, this.longtitude, this.deviceId, this.accountId});

  String latitude;
  String longtitude;
  String deviceId;
  String accountId;

  @override
  String toJson() {
    return jsonEncode({"latitude": this.latitude, "longtitude": this.longtitude, "deviceId": this.deviceId, "accountId": this.accountId});
  }

  factory SendLocationEventPayload.fromRawJson(String str) =>
      SendLocationEventPayload.fromJson(json.decode(str));

  factory SendLocationEventPayload.fromJson(Map<String, dynamic> json) =>
      SendLocationEventPayload(
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        deviceId: json["deviceId"],
        accountId: json["accountId"],
      );
}

class SendChatEvent extends BaseEvent {
  SendChatEvent._({this.payload, this.metadata});

  factory SendChatEvent.build(SendLocationEventPayload payload,
      [Map<String, String> metadata]) {
    return SendChatEvent._(payload: payload.toJson(), metadata: metadata);
  }

  static Map<String, String> get stream => {
        "key": "events",
        "topic": "location",
        "action": "insert",
      };

  @override
  String get topic => SendChatEvent.stream["topic"];
  @override
  String get action => SendChatEvent.stream["action"];

  @override
  Map<String, String> metadata;

  @override
  String payload;
}
