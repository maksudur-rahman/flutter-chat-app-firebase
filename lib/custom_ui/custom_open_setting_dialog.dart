import 'package:flutter/material.dart';

class CustomSettingsDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  CustomSettingsDialog({
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: actions,
    );
  }
}
