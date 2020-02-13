import 'dart:convert';

import 'package:port_tracker/models/load.dart';

class Device {
  String id;
  String name;
  String type;
  String connectedAccountId;
  List historyAccountsId;
  List loads;
  String creationDate;
  Device(this.id, this.name, this.type, this.connectedAccountId, this.historyAccountsId, this.loads, this.creationDate);

  Device.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        name = json['name'],
        type = json['type'],
        connectedAccountId = json['ConnectedAccount'],
        historyAccountsId = json['HistoryAccounts'],
        loads = (json['loads'] as List).map((i) => Load.fromJson(i)).toList(),
        creationDate = json['creationtime'];
}

Device jsonToDevice(String jsonString) {
  Map deviceMap = jsonDecode(jsonString);
  return Device.fromJson(deviceMap);
}