// library my_prj.globals;

// import 'dart:developer';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:port_tracker/models/account.dart';

// final accountStorage = new FlutterSecureStorage();
Account loggedInAccount;

// void storeLoggedInAccount(String accountMail, String accountPassword, String account) async {
//   await accountStorage.write(key: "loggedInAccount", value: account);
//   await accountStorage.write(key: "loggedInAccountMail", value: accountMail);
//   await accountStorage.write(key: "loggedInAccountPassword", value: accountPassword);
//   log("loggedInAccountMail: " + accountMail + " - loggedInAccountPassword: " + accountPassword);
// }

// void removeLoggedInAccount() async {
//   await accountStorage.delete(key: "loggedInAccount");
//   await accountStorage.delete(key: "loggedInAccountMail");
//   await accountStorage.delete(key: "loggedInAccountPassword");
// }

// Future<String> getLoggedInAccount() async {
//   String value = await accountStorage.read(key: "loggedInAccount");
//   return value;
// }

// Future<String> getLoggedInAccountMail() async {
//   String value = await accountStorage.read(key: "loggedInAccountMail");
//   return value;
// }

// Future<String> getLoggedInAccountPassword() async {
//   String value = await accountStorage.read(key: "loggedInAccountPassword");
//   return value;
// }