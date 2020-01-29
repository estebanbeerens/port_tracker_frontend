import 'package:port_tracker/models/feature.dart';
import 'package:port_tracker/models/load.dart';
import 'package:port_tracker/models/location_log.dart';

class Device {
  int id;
  String name;
  String type;
  int connectedAccountId;
  LocationLog locationLog;
  List<int> historyAccountsId;
  List<Feature> features;
  List<DateTime> historyLogin;
  List<DateTime> historyLogout;
  List<Load> loads;
  DateTime timestamp;
}