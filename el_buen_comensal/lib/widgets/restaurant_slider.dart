import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RestaurantSlider extends StatelessWidget {
  final String title;

  const RestaurantSlider({Key? key, required this.title,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, int index){
              return GestureDetector(child: _RestaurantCard(), onTap: () =>  Navigator.pushNamed(context, 'restaurant'));
            }
          ),
        )
      ]),
    );
  }
}

class _RestaurantCard extends StatelessWidget {

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
            child: Image(image: NetworkImage("https://www.disfrutarosario.com/wp-content/uploads/2020/01/restaurant-939435_960_720.jpg"), fit: BoxFit.cover),
          ),
          SizedBox(height: 3),
          Text("La Esquina Real", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("Comida Colombiana", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
          Text("40.000 COP", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
          Text("Cll 42 # 127 - 4", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
          Row(children: [
            Icon(Icons.star, color: AppTheme.primary_yellow),
            Icon(Icons.star, color: AppTheme.primary_yellow),
            Icon(Icons.star, color: AppTheme.primary_yellow),
            Icon(Icons.star, color: AppTheme.primary_yellow),
            Icon(Icons.star, color: AppTheme.primary_yellow),
            SizedBox(width: 5),
            Text("5.0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],)


          
        ]),
    );
  }
}
