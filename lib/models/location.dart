class Location {
  String id;
  String lat;
  String lng;
  String deviceId;
  String accountId;
  DateTime insertTime;
  Location(this.lat, this.lng, this.deviceId, this.accountId);
}