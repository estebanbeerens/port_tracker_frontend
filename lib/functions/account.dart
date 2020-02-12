library my_prj.globals;

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:port_tracker/models/account.dart';

final storage = new FlutterSecureStorage();
Account loggedInAccount;

void storeLoggedInAccount(String accountMail, String accountPassword, String account) async {
  await storage.write(key: "loggedInAccount", value: account);
  await storage.write(key: "loggedInAccountMail", value: accountMail);
  await storage.write(key: "loggedInAccountPassword", value: accountPassword);
  log("loggedInAccountMail: " + accountMail + " - loggedInAccountPassword: " + accountPassword);
}

void removeLoggedInAccount() async {
  await storage.delete(key: "loggedInAccount");
  await storage.delete(key: "loggedInAccountMail");
  await storage.delete(key: "loggedInAccountPassword");
}

Future<String> getLoggedInAccount() async {
  String value = await storage.read(key: "loggedInAccount");
  return value;
}

Future<String> getLoggedInAccountMail() async {
  String value = await storage.read(key: "loggedInAccountMail");
  return value;
}

Future<String> getLoggedInAccountPassword() async {
  String value = await storage.read(key: "loggedInAccountPassword");
  return value;
}