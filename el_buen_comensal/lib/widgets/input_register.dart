import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../ui/input_login_decoration.dart';
import '../ui/input_register_decoration.dart';

class InputRegister extends StatelessWidget {
  final String hint_text;
  final TextInputType type;
  final bool isPasswd;
  final Function validate;
  final Function(String) changed;

  const InputRegister(
      {Key? key,
      required this.hint_text,
      required this.type,
      required this.isPasswd,
      required this.validate,
      required this.changed, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswd,
      keyboardType: type,
      onChanged: (value) {
        changed(value);
      },
      cursorColor: AppTheme.primary_yellow,
      style: const TextStyle(
        height: 1.5,
        fontSize: 20,
      ),
      decoration: InputRegisterDecoration.authInputRegisterDecoration(
          hintText: hint_text),
      validator: (value) {
        return validate(value);
      },
    );
  }
}
