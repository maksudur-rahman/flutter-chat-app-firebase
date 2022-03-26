
import 'package:chat_application_flutter/utils/color_utils.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String headerName;
  final double marginTop;
  final double marginBottom;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double marginLeft;
  final double marginRight;

  CustomHeader({
    required this.headerName,
    this.marginTop = 10,
    this.marginBottom = 10,
    this.fontSize = 17.0,
    this.fontWeight,
    this.color = ColorUtils.SPLASH_BACKGROUND,
    this.marginLeft = 0,
    this.marginRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: marginLeft,
        right: marginRight,
      ),
      child: Column(
        children: [
          SizedBox(height: marginTop),
          Text(
            headerName,
            style: TextStyle(
              color: color,
                fontFamily: 'Roobert',
              fontSize: fontSize,
              fontWeight: fontWeight
            ),
          ),
          SizedBox(height: marginBottom),
        ],
      ),
    );
  }
}
