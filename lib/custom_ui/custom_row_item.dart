import 'package:flutter/material.dart';

class CustomRowItem extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color backgroundColor;
  final bool isEnable;

  CustomRowItem({
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.backgroundColor,
    this.isEnable = true

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? () => onPressed() : null,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Icon(icon, size: 16,color: iconColor),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor),
          ),
          SizedBox(width: 10.0,),
          Text(
            title,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}
