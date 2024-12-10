import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({mes}) {
  return Fluttertoast.showToast(
      msg: mes,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}



showSuccessFlutterToast({msg}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.green,
    fontSize: 16,
  );
}