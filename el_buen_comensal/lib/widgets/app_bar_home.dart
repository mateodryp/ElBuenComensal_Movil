import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppTheme.dark_gray,
        leading: Container(
          child: const IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(Icons.menu,
                color: AppTheme.primary_yellow, size: 35),
            onPressed: null,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: const IconButton(
              icon: Icon(Icons.search_outlined,
                  color: AppTheme.primary_yellow, size: 35),
              onPressed: null,
            ),
          ),
        ],
        title: Container(
            child: const Text("Restaurantes"),
            padding: const EdgeInsets.only(left: 10)));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
