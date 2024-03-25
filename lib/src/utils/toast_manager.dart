import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class ToastManager {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: AppColors.toastBackground,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void errorToast(String message) {
     Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: AppColors.errorToastBackground,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void successToast(String message) {
     Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: "center",
      backgroundColor: AppColors.successToastBackground,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
