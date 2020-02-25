import 'dart:developer';

import 'package:port_tracker/functions/json_helper.dart';
import 'package:port_tracker/globals.dart';

void loginToDevice() async {
  log(currentDevice.id);
  log(loggedInAccount.id);
  Map jsonUserRequest = {"DeviceHex": currentDevice.id, "UserHex": loggedInAccount.id};
  String jsonUserResponse = await postJson("http://www.port-tracker.tk:8420/upconnusr", jsonUserRequest);
  log(jsonUserResponse);
}

void logoutOfDevice() async {
  log(currentDevice.id);
  log(loggedInAccount.id);
  Map jsonUserRequest = {"DeviceHex": currentDevice.id, "UserHex": ""};
  String jsonUserResponse = await postJson("http://www.port-tracker.tk:8420/upconnusr", jsonUserRequest);
  log(jsonUserResponse);
}