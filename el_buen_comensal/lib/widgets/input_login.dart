import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../ui/input_login_decoration.dart';

class InputLogin extends StatelessWidget {
  final String hint_text;
  final IconData icon;
  final TextInputType type;
  final bool isPasswd;

  const InputLogin(
      {Key? key,
      required this.hint_text,
      required this.icon,
      required this.type,
      required this.isPasswd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isPasswd,
        keyboardType: type,
        cursorColor: AppTheme.primary_yellow,
        style: const TextStyle(
          height: 1.5,
          fontSize: 20,
        ),
        decoration: InputLoginDecoration.authInputLoginDecoration(
          hintText: this.hint_text,
          icon: this.icon,
        ));
  }
}
