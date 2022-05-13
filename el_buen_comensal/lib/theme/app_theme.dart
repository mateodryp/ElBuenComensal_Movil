import 'package:flutter/material.dart';

class AppTheme {
  static const Color dark_gray = Color(0xff343434);
  static const Color dark_gray_disable = Color(0xff736B6B);
  static const Color primary_yellow = Color(0xffFCB500);
  static const Color error_inputs = Color.fromRGBO(255, 136, 0, 1);
  

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      accentColor: primary_yellow
    )
  );
}
