import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../ui/input_login_decoration.dart';

class InputLogin extends StatelessWidget {
  final String hint_text;
  final IconData icon;
  final TextInputType type;
  final bool isPasswd;
  final Function validate;
  final Function(String) changed;

  const InputLogin(
      {Key? key,
      required this.hint_text,
      required this.icon,
      required this.type,
      required this.isPasswd,
      required this.changed,
      required this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          return validate(value);
        },
        obscureText: isPasswd,
        keyboardType: type,
        cursorColor: AppTheme.primary_yellow,
        onChanged: (value) {
          changed(value);
        },
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
