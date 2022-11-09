import 'package:el_buen_comensal/share%20preferences/Preferences.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/restaurants_provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final restaurant_provider = Provider.of<RestaurantProvider>(context);
    return  Scaffold(
      drawer: side_menu(),
      appBar: AppBarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LineSeparator(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  RestaurantSlider(title: "Restaurantes Recomendados", list: restaurant_provider.recomendados),
                  SizedBox(height: 20),
                  RestaurantSlider(title: "Restaurantes Mejor Calificados", list: restaurant_provider.mejorCalificados),
                  SizedBox(height: 20),
                  RestaurantSlider(title: "Restaurantes Nuevos", list: restaurant_provider.nuevos),
                  SizedBox(height: 20),
                  RestaurantSlider(title: "Restaurantes Economicos", list: restaurant_provider.masBaratos),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:ButtonBarHome(position: 0) 
      
    );
  }
}

class side_menu extends StatelessWidget {
  const side_menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),

          ListTile(
            leading: const Icon(Icons.favorite, color: AppTheme.primary_yellow, size: 28),
            title: const Text("Restaurantes favoritos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.pushNamed(context, 'favorite_restaurants');
            },
          ),
          ListTile(
            leading: const Icon(Icons.comment, color: AppTheme.primary_yellow, size: 28),
            title: const Text("Comentarios", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.pushNamed(context, 'comments');
            },
          ),  
          ListTile(
            leading: const Icon(Icons.account_circle, color: AppTheme.primary_yellow, size: 28),
            title: const Text("Cambiar contraseña", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.pushNamed(context, 'change_password');
            }),
            SizedBox(height: 320),
            Row(
              children: [
                SizedBox(width: 22),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: AppTheme.primary_yellow,
                  disabledColor: Color.fromARGB(255, 245, 212, 130),
                  elevation: 0,
                  onPressed: () {Navigator.pushNamed(context, "login");},
                  child: Container(
                      width: 225,
                      height: 30,
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('Cerrar Sesión',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14))))
                ),
                SizedBox(width: 20)
                
              ],
            ),
            SizedBox(height: 5),
            Center(child: Text(Preferences.GetNameUser, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)))
        ],
      ),
    );
  }
}



class LineSeparator extends StatelessWidget {
  const LineSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 1,
      
      decoration: BoxDecoration(
        border: null,
        color: Colors.black.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), 
            // changes position of shadow
          ),
        ],
      ),
    );
  }
}


class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image_register.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
  }