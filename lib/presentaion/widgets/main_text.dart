import 'dart:ffi';

import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  String numText;

  MainText({this.numText="" ,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      numText,
      style: TextStyle(fontSize: 90, color: Colors.white),
    );
  }
}
