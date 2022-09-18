import 'package:flutter/material.dart';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import '../theme/app_theme.dart';

class ButtonBarHome extends StatelessWidget {
  final int position;
  const ButtonBarHome({
    Key? key,
    required this.position
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
        barBackgroundColor: AppTheme.dark_gray,
        circleColor: AppTheme.primary_yellow,
        textColor: Colors.white,
        activeIconColor: Colors.white,
        inactiveIconColor: AppTheme.dark_gray_disable,
        initialSelection: position,
        tabs: [
          TabData(
              iconData: (Icons.home_sharp),
              title: "Home",
              onclick: () => Navigator.pushNamed(context, 'home')),
          TabData(
              iconData: Icons.map_outlined,
              title: "Tengo que ir",
              onclick: () => Navigator.pushNamed(context, 'have_to_go')),
          TabData(
              iconData: Icons.favorite,
              title: "Me encantan",
              onclick: () => Navigator.pushNamed(context, 'love_it')),
          TabData(
              iconData: Icons.check,
              title: "Opiniones",
              onclick: () => Navigator.pushNamed(context, 'opinions')),
        ],
        onTabChangedListener: (position) {
        });
  }
}
