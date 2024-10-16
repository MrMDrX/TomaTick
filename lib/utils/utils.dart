import 'package:flutter/material.dart';

List selectableTimes = [
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300",
  "3600",
];

class ColorScheme {
  final Color bgColor;
  final Color appBarColor;

  ColorScheme(this.bgColor, this.appBarColor);
}

ColorScheme renderColor(String currentState) {
  if (currentState == 'BREAK TIME') {
    return ColorScheme(
        Colors.lightBlueAccent.shade100, Colors.lightBlueAccent.shade400);
  } else if (currentState == 'LONG BREAK TIME') {
    return ColorScheme(Colors.greenAccent, Colors.greenAccent.shade400);
  } else {
    return ColorScheme(Colors.redAccent.shade100, Colors.redAccent);
  }
}
