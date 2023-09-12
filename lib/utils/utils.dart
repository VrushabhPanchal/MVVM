import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){

    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.transparent,
      textColor: Colors.white,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context, Color color) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.linearToEaseOut,
          backgroundColor: color,
          duration: Duration(seconds: 3),
          icon: color == Colors.green ? Icon(Icons.done):Icon(Icons.error),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    ));
  }
}
