import 'package:flutter/material.dart';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import '../theme/app_theme.dart';

class ButtonBarHome extends StatelessWidget {
  const ButtonBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      barBackgroundColor: AppTheme.dark_gray,
      circleColor: AppTheme.primary_yellow,
      textColor: Colors.white,
      activeIconColor: Colors.white,
      inactiveIconColor: AppTheme.dark_gray_disable,
      initialSelection: 0,
      tabs: [
        TabData(
          iconData: (Icons.home_sharp), 
          title: "Home",
          onclick: () => Navigator.pushNamed(context, 'home')
        ),
        TabData(
          iconData: Icons.home_sharp, 
          title: "Home"
        ),
        TabData(
          iconData: Icons.home_sharp, 
          title: "Home"
        ),
        TabData(
          iconData: Icons.home_sharp, 
          title: "Home"
        ),
      ],
      onTabChangedListener: (position){

      } );
  }
}