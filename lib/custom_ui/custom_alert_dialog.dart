import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {

  final String title;
  final String content;
  final String yes;
  final String no;
  final Function yesOnPressed;
  final Function noOnPressed;

  CustomAlertDialog({
    required this.title,
    required this.content,
    required this.yesOnPressed,
    required this.noOnPressed,
    required this.yes,
    required this.no
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(title),
      content:  Text(content),
      backgroundColor: Colors.white,
      shape:
      RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
      actions: <Widget>[
         FlatButton(
          child:  Text(this.yes),
          textColor: Colors.greenAccent,
          onPressed: () {
            this.yesOnPressed();
          },
        ),
         FlatButton(
          child: Text(this.no),
          textColor: Colors.redAccent,
          onPressed: () {
            this.noOnPressed();
          },
        ),
      ],
    );
  }
}