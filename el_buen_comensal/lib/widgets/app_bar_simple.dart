import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppBarSimple extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarSimple({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppTheme.dark_gray,
        leading: Container(
          child:  IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(Icons.arrow_back,
                color: AppTheme.primary_yellow, size: 35),
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
        automaticallyImplyLeading: false,
        title: Container(
            child:  Text(title),
            padding: const EdgeInsets.only(left: 10)));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
