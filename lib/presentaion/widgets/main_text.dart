import 'dart:ffi';

import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  int numText;

  MainText({this.numText = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      numText.toString(),
      style: TextStyle(fontSize: 90, color: Colors.white),
    );
  }
}
