import 'package:flutter/material.dart';

class AppNavigation {
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Future<bool>? push(BuildContext context, Widget widget) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }
}
