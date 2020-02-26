import 'dart:developer';

import 'package:port_tracker/functions/json_helper.dart';
import 'package:port_tracker/globals.dart';

void toggleFinishedOfLoad(String loadId, bool finished) async {
  Map jsonLoadFinishedRequest = {"Device": currentDevice.id, "Load": loadId, "Finished": finished};
  String jsonLoadFinishedResponse = await postJson("http://www.port-tracker.tk:8420/finishload", jsonLoadFinishedRequest);
  log(jsonLoadFinishedResponse);
}
