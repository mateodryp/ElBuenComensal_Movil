import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InputRegisterDecoration {
  static InputDecoration authInputRegisterDecoration(
      {required String hintText, IconData? icon}) {
    return  InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primary_yellow)),
        focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primary_yellow, width: 4)),
        hintText: hintText,
        errorStyle: TextStyle(color: AppTheme.error_inputs),
        focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.error_inputs, width: 5)),
    );
  }
}
