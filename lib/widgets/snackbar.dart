import 'package:flutter/material.dart';
import 'package:ms_customer/on_boarding/color.dart';

class MyMessageHandler {
  static void showSnackBar(var scaffoldKey, String message) {
    scaffoldKey.currentState!.hideCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: AppColor1.primaryColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        )));
  }
}
