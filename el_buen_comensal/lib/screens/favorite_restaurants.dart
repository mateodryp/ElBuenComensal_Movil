 import 'package:el_buen_comensal/widgets/button_bar_home.dart';
import 'package:el_buen_comensal/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FavoriteRestaurants extends StatelessWidget {
   
  const FavoriteRestaurants({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarSimple(title: "Restaurantes Favoritos",),
      body: Column(
        children: [
          Expanded(
             child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: ( _, int index ) => _RestaurantList()
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantList extends StatelessWidget {
  const _RestaurantList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Image(image: NetworkImage("https://i.blogs.es/e1feab/google-fotos/1366_2000.webp"), fit: BoxFit.cover, width: 140, height: 100),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text("Restaurante el gran restaurante",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
                        Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
                        Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
                        Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
                        Icon(Icons.star, color: AppTheme.primary_yellow , size: 25,),
                        SizedBox(width: 10),
                        Text("5", style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("Cll 67a # 113 - 60", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){print("Visitar");},
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
                          onTap:  (){print("Eliminar");},
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