
import 'package:chat_application_flutter/main.dart';
import 'package:flutter/material.dart';
class NavigatorUtils {
  static void push(BuildContext context, Widget widget) {
    logger.v('Navigating to ${widget.runtimeType}');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void pushAndListenToOnBack({
    required BuildContext context,
    required Widget widget,
    required Function onBackListener,
  }) {
    logger.v('Navigating to ${widget.runtimeType}');
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (context) => widget),
        )
        .then((value) => onBackListener());
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void pushAndRemoveUntil(BuildContext context, Widget widget) {
    logger.v('Navigating to ${widget.runtimeType}');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }

  static void pushAndRemoveUntilFirst(BuildContext context, Widget widget) {
    logger.v('Navigating to ${widget.runtimeType}');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
          (route) => route.isFirst,
    );
  }

  static void pushAndRemoveUntilFirstAndListenToOnBack({
    required BuildContext context,
    required Widget widget,
    required Function onBackListener,
  }) {
    logger.v('Navigating to ${widget.runtimeType}');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => route.isFirst,
    ).then((value) => onBackListener());
  }
}
