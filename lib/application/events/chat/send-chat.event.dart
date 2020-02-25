import 'dart:convert';

import 'package:port_tracker/domain/events/base-event.dart';
import 'package:port_tracker/domain/interfaces/i-payload.dart';

class SendChatEventPayload implements IPayload {
  SendChatEventPayload({this.user, this.message});

  String user;
  String message;

  @override
  String toJson() {
    return jsonEncode({"user": this.user, "message": this.message});
  }

  factory SendChatEventPayload.fromRawJson(String str) =>
      SendChatEventPayload.fromJson(json.decode(str));

  factory SendChatEventPayload.fromJson(Map<String, dynamic> json) =>
      SendChatEventPayload(
        user: json["user"],
        message: json["message"],
      );
}

class SendChatEvent extends BaseEvent {
  SendChatEvent._({this.payload, this.metadata});

  factory SendChatEvent.build(SendChatEventPayload payload,
      [Map<String, String> metadata]) {
    return SendChatEvent._(payload: payload.toJson(), metadata: metadata);
  }

  static Map<String, String> get stream => {
        "key": "events",
        "topic": "chat",
        "action": "send",
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
