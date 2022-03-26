
import 'package:chat_application_flutter/utils/color_utils.dart';
import 'package:chat_application_flutter/utils/page_utils.dart';
import 'package:flutter/material.dart';


class CustomRaisedButton extends StatelessWidget {
  final Function? onButtonPressed;
  final String buttonName;
  final double buttonWidth;
  final double buttonHeight;
  final double textSize;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;
  final Color backgroundColor;
  final Color textColor;
  final bool isEnable;
  final double horizontalPaddingAroundText;
  final double verticalPaddingAroundText;
  final double borderRadius;

  CustomRaisedButton({
    this.onButtonPressed,
    required this.buttonName,
    this.buttonHeight = 50,
    required this.buttonWidth,
    this.textSize = 18,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.paddingRight = 0,
    this.paddingTop = 0,
    this.marginLeft = 60,
    this.marginRight = 60,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.backgroundColor = ColorUtils.SPLASH_BACKGROUND,
    this.textColor = Colors.white,
    this.isEnable = true,
    this.horizontalPaddingAroundText = 25,
    this.verticalPaddingAroundText = 10,
    this.borderRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: paddingBottom),
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginBottom),
      height: buttonHeight,
      child: RaisedButton(
        onPressed: isEnable
            ? () {
                PageUtils.hideKeyboard(context);
                onButtonPressed!();
              }
            : null,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPaddingAroundText,
              horizontal: horizontalPaddingAroundText),
          child: Text(
            buttonName,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
