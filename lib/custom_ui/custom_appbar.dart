import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool isPressed;
  final String title;
  final bool isCenterTitle;
  final bool showLeadingBackButton, automaticallyImplyLeading;
  final bool isEnable, isBottom;
  final Color? statusBarColor, backgroundColor, titleColor, leadingBackButton;
  final Brightness? statusBarIconBrightness;
  final List<Widget>? actions;
  final FontWeight? fontWeight;
  final double? fontSize;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    this.isPressed = false,
    this.title = "",
    this.isCenterTitle = true,
    this.showLeadingBackButton = false,
    this.isEnable = true,
    this.statusBarColor = Colors.white,
    this.statusBarIconBrightness,
    this.backgroundColor = Colors.white,
    this.actions,
    this.fontWeight,
    this.fontSize,
    this.titleColor,
    this.automaticallyImplyLeading = false,
    this.leadingBackButton = Colors.black,
    this.bottom,
    this.isBottom = false,
    Key? key,
  })  : preferredSize = Size.fromHeight(isBottom ? 90.0 : 55.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: TextStyle(
              color: titleColor,
              fontWeight: fontWeight,
              fontSize: fontSize
          ),
        ),
        centerTitle: isCenterTitle,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
            statusBarIconBrightness: statusBarIconBrightness),
        leading: showLeadingBackButton
            ? _customBackButton()
            : const SizedBox.shrink(),
        bottom: bottom,
        actions: actions);
  }

  Widget _customBackButton() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.arrow_back, color: leadingBackButton, size: 30.0),
          onPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
