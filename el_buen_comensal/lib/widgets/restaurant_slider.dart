import 'package:el_buen_comensal/models/Restaurant.dart';
import 'package:el_buen_comensal/providers/restaurants_provider.dart';
import 'package:el_buen_comensal/services/services.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantSlider extends StatefulWidget {
  final String title;

  const RestaurantSlider({Key? key, required this.title,}): super(key: key);

  @override
  State<RestaurantSlider> createState() => _RestaurantSliderState();
}

class _RestaurantSliderState extends State<RestaurantSlider> {
  @override
  Widget build(BuildContext context) {

    final restaurant_provider = Provider.of<RestaurantProvider>(context);


    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(widget.title,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurant_provider.prueba.length,
            itemBuilder: (_, int index){
              return GestureDetector(child: _RestaurantCard(restaurant: restaurant_provider.prueba[index],), onTap: () =>  Navigator.pushNamed(context, 'restaurant', arguments: restaurant_provider.prueba[index]));
            }
          ),
        )
      ]),
    );
  }
}

class _RestaurantCard extends StatelessWidget {

  final Restaurant restaurant;

  const _RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 165,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 110,
            child: Image(image: NetworkImage("http://129.151.106.64:8000" + restaurant.images[0]), fit: BoxFit.cover),
          ),
          SizedBox(height: 3),
          Text(restaurant.name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(restaurant.typeFood, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          Text(restaurant.prices.toString() + " COP", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          Text(restaurant.address, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w300)),
          Row(children: [
            Icon(Icons.star, color: restaurant.punctuation >= 1 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable ),
            Icon(Icons.star, color: restaurant.punctuation >= 2 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable ),
            Icon(Icons.star, color: restaurant.punctuation >= 3 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable ),
            Icon(Icons.star, color: restaurant.punctuation >= 4 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable ),
            Icon(Icons.star, color: restaurant.punctuation == 5 ? AppTheme.primary_yellow : AppTheme.dark_gray_disable ),
            SizedBox(width: 5),
            Text(restaurant.punctuation.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],)


          
        ]),
    );
  }
}
