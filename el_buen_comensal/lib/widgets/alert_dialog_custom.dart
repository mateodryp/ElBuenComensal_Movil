import 'package:el_buen_comensal/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';


class AlertDialogCustom extends StatelessWidget {

  final String title;
  final String message;
  final String? rute;

  const AlertDialogCustom({
    Key? key, required this.title, required this.message, this.rute="",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      title:  Text(title, textAlign: TextAlign.center),
      shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Text(message,textAlign: TextAlign.center,),

          SizedBox( height: 10 ),
        ],
      ),
      actions: [
        Center(
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppTheme.primary_yellow,
            onPressed: () => rute!.isEmpty ? Navigator.pop(context) : Navigator.of(context).pushNamedAndRemoveUntil("login", (Route<dynamic> route) => false),
            elevation: 0,
            child: Container(
              width: 60,
              height: 30,
              child: const Align(alignment: Alignment.center,child: Text('Ok', style: TextStyle(color: Colors.white, fontSize: 16)))
            )
          )
        )
      ]
                             );
  }
}