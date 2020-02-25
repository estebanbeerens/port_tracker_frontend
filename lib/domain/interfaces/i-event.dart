abstract class IEvent {
  String topic;
  String action;
  Map<String, String> metadata;
  String payload;
}
