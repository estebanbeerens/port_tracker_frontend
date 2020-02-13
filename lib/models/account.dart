import 'dart:convert';

class Account {
  String id;
  String firstName;
  String lastName;
  String mail;
  String token;
  List roles;
  bool isModerator;
  List connectedDevices;
  List historyDevices;
  Account(this.id, this.firstName, this.lastName, this.mail, this.token,
      this.roles, this.isModerator, this.connectedDevices, this.historyDevices);

  Account.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        firstName = json['firstname'],
        lastName = json['lastname'],
        mail = json['mail'],
        token = json['token'],
        roles = json['roles'],
        isModerator = json['is_moderator'],
        connectedDevices = json['ConnectedDevices'],
        historyDevices = json['HistoryDevices'];
}

Account jsonToAccount(String jsonString) {
  Map accountMap = jsonDecode(jsonString);
  return Account.fromJson(accountMap);
}