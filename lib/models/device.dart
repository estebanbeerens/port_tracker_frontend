import 'package:port_tracker/models/load.dart';

class Device {
  String id;
  String name;
  String type;
  String connectedAccountId;
  List<String> historyAccountsId;
  List<Load> loads;
  DateTime creationDate;
  Device(this.id, this.name, this.type, this.connectedAccountId, this.historyAccountsId, this.loads, this.creationDate);
}