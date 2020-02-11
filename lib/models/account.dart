class Account {
  String id;
  String firstName;
  String lastName;
  String mail;
  String token;
  List<String> roles;
  bool isModerator;
  List<String> connectedDevices;
  List<String> historyDevices;
  Account(this.id, this.firstName, this.lastName, this.mail, this.token, this.roles, this.isModerator, this.connectedDevices, this.historyDevices);
}