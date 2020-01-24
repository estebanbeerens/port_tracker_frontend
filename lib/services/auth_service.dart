import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  AuthService() {
    print("new AuthService");
  }

  Future getUser() {
    return Future.value(currentUser);
  }

  Future logout() {
    this.currentUser = null;
    notifyListeners();
    return Future.value(null);
  }

  Future createUser(
    {String username,
    String password}) async{}
  
  Future loginUser({String username, String password}) {
    if (password == "testpass") {
      this.currentUser = {'username': username};
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(this.currentUser);
    }
  }
}