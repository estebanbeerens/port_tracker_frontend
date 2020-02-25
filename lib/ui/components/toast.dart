import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void createToast(String text, Color color) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIos: 2,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0
  );
}