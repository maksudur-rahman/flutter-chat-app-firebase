import 'dart:ui';

import 'package:intl/intl.dart';

class FormValidator {
  static String? validateTextForm(String text) {
    if (text == null || text.isEmpty) return "Please Fill";
    return null;
  }

  static String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 11) return 'Mobile Number must be of 11 digit';
    return null;
  }

  static String? validateDropDownForm(dynamic dynamic) {
    if (dynamic == null) return "Please Select";
    return null;
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  static String getPaymentMethod(String type){
    String pay_type = '';
    switch(type){
      case 'Cash On Delivery':
        pay_type = "COD";
        break;
    }
    return pay_type;
  }

  static String? getFormattedTime(String dateTime) {
    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(dateTime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MMMM dd, hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    //var postfix = parts[1].trim();
    return outputDate;
  }

}
