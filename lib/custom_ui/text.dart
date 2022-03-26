import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? fontsize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  CustomText(
      {
      this.text,
      this.textAlign,
      this.fontWeight,
      this.textColor,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'text',
      textAlign: textAlign,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: textColor),
    );
  }
}
