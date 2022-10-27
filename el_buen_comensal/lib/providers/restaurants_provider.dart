
import 'dart:async';

import 'package:el_buen_comensal/helpers/debouncer.dart';
import 'package:el_buen_comensal/models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantProvider extends ChangeNotifier {

 final String _baseUrl = '144.22.197.146:8000';

  List<Restaurant> prueba = [];
  bool isloading = true;
  final debouncer = Debouncer(
    duration: Duration(seconds: 1),
  );

  final StreamController<bool> _streamController = new StreamController.broadcast();
  Stream<bool> get sugestions => this._streamController.stream;

  RestaurantProvider() {

    this.getRestaurants();

  }


  void getRestaurants() async {

    final url = Uri.http(_baseUrl, "/restaurants/restaurants_info/");
    final resp = await http.get(url);
    final restaurants = Restaurants.fromJson(utf8.decode(resp.bodyBytes));
    prueba = restaurants.results;
    isloading = false;
    notifyListeners();
  }

  Future<bool> searchRestaurants(String query) async{
    print(query);
    return false;

  }

  void getSugestionByQuery(String search){
    debouncer.value = '';
    debouncer.onValue = (value)async{
      print("tenemos valor: " + value);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) { 
      debouncer.value = search;
    });

    Future.delayed(Duration(milliseconds: 301 )).then((value) => timer.cancel());
  }



}