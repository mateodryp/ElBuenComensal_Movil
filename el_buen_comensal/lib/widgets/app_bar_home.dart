import 'package:el_buen_comensal/search/search_delegate.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppTheme.dark_gray,
        leading: Container(
          child:  IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(Icons.menu,
                color: AppTheme.primary_yellow, size: 35),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child:  IconButton(
              icon: Icon(Icons.search_outlined,
                  color: AppTheme.primary_yellow, size: 35),
              onPressed: (){ showSearch(context: context, delegate: RestaurantSeachDelegate());},
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
