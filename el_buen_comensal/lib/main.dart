import 'package:flutter/material.dart';
import 'package:el_buen_comensal/screens/screens.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:flutter/services.dart';

void main() async{
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Buen Comensal',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'restaurant': (_) => RestaurantScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}