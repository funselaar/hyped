import 'package:flutter/material.dart';

class AppTheme {
  static final primaryColor = _hexColor("#DB1D8B");
  static final secondaryColor = _hexColor("#5098CD");

  static final backgroundColor = Colors.white;
  static final textColor = Colors.black;
  static final textGreyColor = Colors.grey;
  static final buttonTextColor = Colors.white;

  static final textStyle = TextStyle(fontFamily: "Source Sans Pro", color: textColor);
  static final titleTextStyle = textStyle.copyWith(fontSize: 34.0, fontWeight: FontWeight.w600);
  static final buttonTextStyle = textStyle.copyWith(fontSize: 17.0, color: buttonTextColor);

  static final smallTripTimeTextStyle = textStyle.copyWith(fontSize: 16.0, color: textGreyColor);
  static final bigTripTimeTextStyle = textStyle.copyWith(fontSize: 38.0, );

  static Color _hexColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}