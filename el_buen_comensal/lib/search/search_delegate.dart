


import 'package:el_buen_comensal/providers/restaurants_provider.dart';
import 'package:el_buen_comensal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Text("Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.location_on, color: AppTheme.primary_yellow, size: 120)
        ),
      );

    }else{
      final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
      restaurantProvider.getSugestionByQuery(query);
      return StreamBuilder(
        stream: restaurantProvider.sugestions,
        builder: (_, AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData){
            return Container(
              child: Center(
              child: Icon(Icons.dangerous, color: AppTheme.primary_yellow, size: 120)
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