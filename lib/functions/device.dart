import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:port_tracker/models/device.dart';

String scannedQR;
Device currentDevice;
String _url = "http://www.port-tracker.tk:8000/api/devices/" + scannedQR;

Future<Device> getCurrentDevice() async {
  final response = await http.get(_url);
  return Device.fromJson(json.decode(response.body));
}