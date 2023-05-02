import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Flushbars {
  static positive(BuildContext context, String? title, String? message) {
    Flushbar(
      title: title == null || title == "" ? "Success!" : title,
      message: message == null || message == "" ? "Success" : message,
      duration: Duration(seconds: 1, milliseconds: 500),
      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.all(10),
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Colors.grey.shade200,
      messageColor: Colors.indigo,
      titleColor: Colors.indigo,
    )..show(context);
  }

  static negative(BuildContext context, String? title, String? message) {
    Flushbar(
      title: title == null || title == "" ? "Failed" : title,
      message: message == null || message == ""
          ? "Task failed. Please try again later"
          : message,
      duration: Duration(seconds: 1, milliseconds: 500),
      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.all(10),
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Colors.red.shade100,
      messageColor: Colors.red.shade700,
      titleColor: Colors.red.shade700,
    )..show(context);
  }
}
