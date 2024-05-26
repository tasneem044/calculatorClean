import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalButton {
  String number;
  late Function onTab;
  Color btnColor;
  Color textColor;

  CalButton(
      {this.textColor =Colors.white,this.btnColor = Colors.orange, this.number = "0", required this.onTab});
}
