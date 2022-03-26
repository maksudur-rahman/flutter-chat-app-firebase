import 'package:flutter/widgets.dart';

class CourierControler{
  final TextEditingController name;
  final TextEditingController charge;
  final TextEditingController freeAboveAmount;

  CourierControler(
      this.name,
      this.charge,
      this.freeAboveAmount
      );
}