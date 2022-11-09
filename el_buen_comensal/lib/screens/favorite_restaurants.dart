 import 'package:el_buen_comensal/providers/restaurants_provider.dart';
import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Restaurant.dart';
import '../theme/app_theme.dart';

class FavoriteRestaurants extends StatelessWidget {
   
  const FavoriteRestaurants({Key? key}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {

    final restaurant_provider = Provider.of<RestaurantProvider>(context);

    return  Scaffold(
      appBar: AppBarSimple(title: "Restaurantes Favoritos",),
      body: SingleChildScrollView(

        child: Column(

          children: [
            FutureBuilder(
              future: restaurant_provider.getRestaurantsFavorites(),
              builder: (_, AsyncSnapshot<List<Restaurant>> snapshot){
                if(!snapshot.hasData){
                    return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      child: Text("Cargando.....", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
                    ),
                  );
                }
                final List<Restaurant> list_favorite = snapshot.data as List<Restaurant>;
                if(list_favorite.isNotEmpty){
                    return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: list_favorite.length,
                          itemBuilder: ( _, int index ) => _RestaurantList(restaurant: list_favorite[index])
                        ),
                      ),
                    ],
                  );
            
                }else{
                    return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                    height: 30,
                    width: double.infinity,
                    child: Text("No hay restaurantes en la lista", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
                  ),
                  );    
                }      
              
              }
            ),
            
          ],
        ),
      ),
    );
  }
}

class _RestaurantList extends StatelessWidget {

  final Restaurant restaurant;

  const _RestaurantList({
    Key? key, required this.restaurant,
  }) : super(key: key);

  void displayEliminate(BuildContext context, int id_restaurant) async{
    final restaurantProvider =Provider.of<RestaurantProvider>(context, listen: false);
    bool respuesta = await restaurantProvider.eliminateFavorite(id_restaurant);

    if(respuesta){
      showDialog(barrierDismissible: false,context: context, builder: (context){
      return AlertDialog(
        elevation: 5,
        title: Text("Respuesta"),
        shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Se ha eliminado correctamente'),
              SizedBox( height: 10 ),
            ],
          ),
        actions: [

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar', style: TextStyle(color: AppTheme.primary_yellow, fontSize: 16),)
            ),

          ],
      );
    });

    }else{
      showDialog(barrierDismissible: false,context: context, builder: (context){
      return AlertDialog(
        elevation: 5,
        title: Text("Respuesta"),
        shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10) ),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Error al eliminar el restaurante'),
              SizedBox( height: 10 ),]
          ),
        actions: [

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar', style: TextStyle(color: AppTheme.primary_yellow, fontSize: 16),)
            ),

          ],
      );
    });
    }
  }

  @override
  Widget build(BuildContext context) {

    final restaurant_provider = Provider.of<RestaurantProvider>(context);
    return Container(
      width: double.infinity,
      height: 110,
      margin:EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:  double.infinity,
            height: 110,
            child: Row(
              children: [
                Image(image: NetworkImage("http://129.151.106.64:8000" + restaurant.images[0]), fit: BoxFit.cover, width: 140, height: 100),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(restaurant.name,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: restaurant.punctuation >= 1 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 25,),
                    Icon(Icons.star, color: restaurant.punctuation >= 2 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 25,),
                    Icon(Icons.star, color: restaurant.punctuation >= 3 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 25,),
                    Icon(Icons.star, color: restaurant.punctuation >= 4 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 25,),
                    Icon(Icons.star, color: restaurant.punctuation == 5 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable , size: 25,),   
                        SizedBox(width: 10),
                        Text(restaurant.punctuation.toString(), style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(restaurant.address, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){Navigator.pushNamed(context, 'restaurant',arguments: restaurant);},
                          child: Container(
                            alignment: Alignment.center,
                            height: 23,
                            width: 80,
                            child: Text("Visitar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            color: AppTheme.primary_yellow,
                          ),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap:  () {
                            displayEliminate(context, restaurant.idRestaurant);
                            
                            },
                          child: Container(
                            alignment: Alignment.center,
                            height: 23,
                            width: 80,
                            child:Text("Eliminar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            color: AppTheme.primary_yellow,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}