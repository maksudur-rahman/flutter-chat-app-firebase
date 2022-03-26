
import 'package:chat_application_flutter/custom_ui/custom_button.dart';
import 'package:chat_application_flutter/utils/color_utils.dart';
import 'package:chat_application_flutter/utils/navigator_utils.dart';
import 'package:flutter/material.dart';


class DialogUtils {
  static void showCustomDialog({
    required BuildContext context,
    required String errorMessage,
    required String title,
    Color? titleColor,
    required String buttonName,
    required Function onButtonPressed,
  }) {
    Future.delayed(Duration.zero, () async {
      await showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text(
                title,
                style: const TextStyle(color: ColorUtils.BUYER_PRIMARY),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CustomButton(
                  onButtonPressed: onButtonPressed,
                  buttonName: buttonName,
                  backgroundColor: const Color(0xff099D21),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  static void showCustomDialogTwoButton({
    required BuildContext context,
    required String errorMessage,
    required String title,
    Color? titleColor,
    required String positiveButtonName,
    required String negativeButtonName,
    required Function onPositiveButtonPressed,
    required Function onNegativeButtonPressed,
  }) {
    Future.delayed(Duration.zero, () async {
      await showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text(
                title,
                style: TextStyle(color: titleColor),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      errorMessage,
                      style: TextStyle(color: ColorUtils.BUYER_PRIMARY),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CustomButton(
                  onButtonPressed: onPositiveButtonPressed,
                  buttonName: positiveButtonName,
                  backgroundColor: Colors.red,
                ),
                CustomButton(
                  onButtonPressed: onNegativeButtonPressed,
                  buttonName: negativeButtonName,
                  backgroundColor: Color(0xff099D21),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  static void showNoInternetDialog(BuildContext context) {
    showCustomDialog(
        context: context,
        errorMessage:
            'You are not connected to Internet. Internet connection is required.',
        title: 'No Internet',
        titleColor: Colors.red,
        buttonName: 'Ok',
        onButtonPressed: () => NavigatorUtils.pop(context));
  }
}
