import 'package:chat_application_flutter/utils/color_utils.dart';
import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  final String text;
  final Function onButtonPressed;
  final bool isEnable;

  CustomAddButton({
    required this.text,
    required this.onButtonPressed,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.height * .27,
      decoration: BoxDecoration(
          color: ColorUtils.PRODUCT_BUTTON_BACKGROUND, // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
      ),
      child: GestureDetector(
        onTap: isEnable ? () => onButtonPressed() : null,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageIcon(
                AssetImage('assets/images/product.png'),
              size: 15.0,
              color: Colors.white,
            ),
            SizedBox(width: 3.0,),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
