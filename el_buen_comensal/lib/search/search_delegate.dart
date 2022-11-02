


import 'package:el_buen_comensal/providers/restaurants_provider.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Restaurant.dart';
import '../models/search_restaurants.dart';

class RestaurantSeachDelegate extends SearchDelegate{
@override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar Restaurante';
  @override
  // TODO: implement searchFieldDecorationTheme
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(fontSize: 16, backgroundColor: Colors.white);
  TextField textField = TextField(
    obscureText: true ,
  );


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () => query = "", 
        icon: Icon(Icons.clear)
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(
        onPressed: () => close(context, null), 
        icon: Icon(Icons.arrow_back)
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container(
        child: Center(
        child: Icon(Icons.place, color: AppTheme.primary_yellow, size: 120)
        ),
      );

    }else{
      final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
      restaurantProvider.getSugestionByQuery(query);
      return StreamBuilder(
        stream: restaurantProvider.sugestions,
        builder: (_, AsyncSnapshot<List<Search>> snapshot){
          if(!snapshot.hasData){
            return Container(
              child: Center(
              child: Text("Cargando Resultados .....", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),)
              ),
            );
          }

          final List<Search> list_search = snapshot.data as List<Search>;
          if(list_search.isNotEmpty){

            return Column(
              children: [
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list_search.length,
                  itemBuilder: (_, int index) {
                    Restaurant restaurant = new Restaurant(idRestaurant: list_search[index].restaurantId, name: list_search[index].name, menu: list_search[index].menu, address: list_search[index].address, prices: list_search[index].prices, typeFood: list_search[index].typeFood, punctuation: list_search[index].punctuation, schedule: list_search[index].schedule, description: list_search[index].description, images: list_search[index].images);
                    return GestureDetector(child: _SearchList(restaurant: restaurant), onTap: () =>  Navigator.pushNamed(context, 'restaurant',arguments: restaurant));
                  }
                )
              )
            ],
            );
          }else{
            return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 30,
              width: double.infinity,
              child: Text("No hay resultados disponibles", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
            ),
          );
          }
          return Container();

        }
      );
    }
    return Text("Suggestions");
  }

}

class _SearchList extends StatelessWidget {
  final Restaurant restaurant;

  const _SearchList({
    Key? key, required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin:EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:  double.infinity,
            height: 120,
            child: Row(
              children: [
                Image(image: NetworkImage("http://129.151.106.64:8000" + restaurant.images[1]), fit: BoxFit.cover, width: 140, height: 105),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(restaurant.name,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    SizedBox(height: 2),
                    Row(
                      children: [
                          Icon(Icons.star, color: restaurant.punctuation >= 1 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
                          Icon(Icons.star, color: restaurant.punctuation >= 2 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
                          Icon(Icons.star, color: restaurant.punctuation >= 3 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
                          Icon(Icons.star, color: restaurant.punctuation >= 4 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
                          Icon(Icons.star, color: restaurant.punctuation == 5 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable, size: 25, ),
                        SizedBox(width: 10),
                        Text(restaurant.punctuation.toString(), style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(restaurant.typeFood, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
                    SizedBox(height: 4),
                    Text(restaurant.address, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
                    SizedBox(height: 4),
                    Text(restaurant.prices.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),


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