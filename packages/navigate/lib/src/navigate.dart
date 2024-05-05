import 'package:flutter/material.dart';

class Navigate {
  const Navigate();

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
  static void pushAndRemoveUntil(BuildContext context, Widget page, {bool predicate = false}) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => predicate,
    );
  }

  static void pop(BuildContext context, {dynamic results}) {
    Navigator.of(context).pop(results);
  }

}
