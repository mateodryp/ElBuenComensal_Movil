import 'package:el_buen_comensal/providers/califications_provider.dart';
import 'package:el_buen_comensal/providers/change_password_provider.dart';
import 'package:el_buen_comensal/providers/comments_provider.dart';
import 'package:el_buen_comensal/providers/login_form_provider.dart';
import 'package:el_buen_comensal/providers/register_form_provider.dart';
import 'package:el_buen_comensal/providers/restaurants_provider.dart';
import 'package:el_buen_comensal/providers/user_info_provider.dart';
import 'package:el_buen_comensal/screens/change_password.dart';
import 'package:el_buen_comensal/screens/give_information.dart';
import 'package:el_buen_comensal/screens/splash_screen.dart';
import 'package:el_buen_comensal/services/user_services.dart';
import 'package:el_buen_comensal/share%20preferences/Preferences.dart';
import 'package:flutter/material.dart';
import 'package:el_buen_comensal/screens/screens.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserServices()),
      ChangeNotifierProvider(create: (_) => CalificationProvider()),
      ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
      ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
      ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      ChangeNotifierProvider(create: (_) => RestaurantProvider(), lazy: false),
      ChangeNotifierProvider(create: (_) => CommentsProvider(), lazy: false)
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Buen Comensal',
      //home: SplashFuturePage(),
      home: SplashFuturePage(),
      //initialRoute: "login",
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'restaurant': (_) => RestaurantScreen(),
        'give_information' : (_) => GiveInformationScreen(),
        'have_to_go' : (_) => HaveToGoScreen(),
        'love_it' : (_) => LoveItScreen(),
        'opinions' : (_) => OpinionsScreen(),
        'favorite_restaurants' : (_) => FavoriteRestaurants(),
        'comments' : (_) => Comments(),
        'change_password' : (_) => ChangePassword()
      },
      theme: AppTheme.lightTheme,
    );
  }
}
