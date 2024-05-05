import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'exports.dart';

class MSToast {
  const MSToast();

  static void showToast(
    String message, {
    Color textColor = Colors.white,
    Color backgroundColor = MSColors.toastBackground,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  static void errorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: MSColors.errorToastBackground,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void successToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: MSColors.successToastBackground,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
