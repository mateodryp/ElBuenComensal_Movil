import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InputLoginDecoration {
  static InputDecoration authInputLoginDecoration({required String hintText, IconData? icon}) {
    return  InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primary_yellow)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primary_yellow, width: 4)),
        hintText: hintText,
        suffixIcon: Icon(icon, color: AppTheme.primary_yellow),
        );
  }
}
