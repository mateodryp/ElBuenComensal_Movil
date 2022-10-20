
import 'package:el_buen_comensal/models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantProvider extends ChangeNotifier {

 final String _baseUrl = '144.22.197.146:8000';

  List<Restaurant> prueba = [];

  RestaurantProvider() {

    this.getRestaurants();

  }


  void getRestaurants() async {

    final url = Uri.http(_baseUrl, "/restaurants/restaurants_info/");
    final resp = await http.get(url);
    final restaurants = Restaurants.fromJson(utf8.decode(resp.bodyBytes));
    prueba = restaurants.results;
    notifyListeners();
  }



}