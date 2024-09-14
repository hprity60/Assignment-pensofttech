import 'package:assignment_app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class MySnackBar {
  static void showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Please provide required fields'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static SnackBar viewMessage(
      {required String message, int seconds = 10, SnackBarAction? action}) {
    return SnackBar(
      action: action,
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
        ],
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: Colors.green,
    );
  }

  static SnackBar successMessage({required String message, int seconds = 3}) {
    return SnackBar(
      dismissDirection: DismissDirection.endToStart,
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(message)),
        ],
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: Colors.green,
    );
  }

  static SnackBar errorMessage({required String message, int seconds = 5}) {
    return SnackBar(
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(message)),
          InkWell(
              onTap: () {},
              child: const Icon(
                Icons.highlight_remove,
                color: whiteColor,
              ))
        ],
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: Colors.red,
    );
  }
}
