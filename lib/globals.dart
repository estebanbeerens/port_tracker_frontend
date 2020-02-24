import 'package:port_tracker/models/device.dart';
import 'package:port_tracker/models/account.dart';
import 'package:port_tracker/models/load.dart';

// Login
Account loggedInAccount;

// QR Scanner
String scanResult;
Device currentDevice;
List<Load> currentLoads = List<Load>();