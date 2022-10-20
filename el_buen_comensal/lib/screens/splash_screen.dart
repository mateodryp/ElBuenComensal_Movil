import 'dart:async';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:el_buen_comensal/screens/give_information.dart';
import 'package:el_buen_comensal/screens/home_screen.dart';
import 'package:el_buen_comensal/screens/login_screen.dart';
import 'package:el_buen_comensal/share%20preferences/Preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/User.dart';
import '../providers/user_info_provider.dart';
import '../services/user_services.dart';
import '../theme/app_theme.dart';

class SplashFuturePage extends StatefulWidget {
  SplashFuturePage({Key? key}) : super(key: key);

  @override
  _SplashFuturePageState createState() => _SplashFuturePageState();
}

class _SplashFuturePageState extends State<SplashFuturePage> {
  Future<Widget> futureCall() async {
    final userServices = Provider.of<UserServices>(context,listen: false);
    if(Preferences.GetIdUser != "" && Preferences.GetToken != ""){
      User user = await userServices.checkSession(int.parse(Preferences.GetIdUser), Preferences.GetToken);
      if(user.code == 1){
        Future.delayed(Duration(seconds: 2));
        context.read<UserInfoProvider>().setUser(user);
        if(user.userNew){
          return Future.value(new GiveInformationScreen());
        }else{
          return Future.value(new HomeScreen());
        }
      }else{
        await Future.delayed(Duration(seconds: 3));
        return Future.value(new LoginScreen());
      }
    }
    await Future.delayed(Duration(seconds: 3));
    return Future.value(new LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 120,
      logo: Image(image: AssetImage('assets/logo_white.png')),
      backgroundColor: AppTheme.primary_yellow,
      showLoader: true,
      loaderColor: Colors.white,
      loadingText: Text("Cargando", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
      futureNavigator: futureCall(),
    );
  }
}