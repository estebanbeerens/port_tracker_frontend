import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void createToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 2,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0
  );
}