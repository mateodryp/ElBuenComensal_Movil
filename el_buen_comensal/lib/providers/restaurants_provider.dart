
import 'dart:async';

import 'package:el_buen_comensal/helpers/debouncer.dart';
import 'package:el_buen_comensal/models/Restaurant.dart';
import 'package:el_buen_comensal/share%20preferences/Preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/search_restaurants.dart';

class RestaurantProvider extends ChangeNotifier {

 final String _baseUrl = '129.151.106.64:8000';

  List<Restaurant> prueba = [];
  bool isloading = true;
  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Search>> _streamController = new StreamController.broadcast();
  Stream<List<Search>> get sugestions => this._streamController.stream;

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

  Future<List<Restaurant>> getRestaurantsFavorites() async {

    final url = Uri.http(_baseUrl, "/suggestions/favorites_list_restaurant/"+ Preferences.GetIdUser +"/");
    final resp = await http.get(url);
    final Map<String, dynamic> decodedResp = json.decode(utf8.decode(resp.bodyBytes));
    if(decodedResp["restaurants"].length == 0){
      List<Restaurant> list = [];
      return list;
    }else{
      final restaurants = Restaurants.fromJson(utf8.decode(resp.bodyBytes));
      notifyListeners();
      return restaurants.results;
    }
  }

  Future<List<Search>> searchRestaurants(String query) async{

    final url = Uri.http(_baseUrl, "/restaurants/search/"+query + "/");
    final resp = await http.get(url);
    final Map<String, dynamic> decodedResp = json.decode(utf8.decode(resp.bodyBytes));
    print(decodedResp["search"].toString());
    if(decodedResp["search"].length == 0){
      List<Search> no_cali = [];
      return no_cali;
    }else{
      final searches = SearchRestaurants.fromJson(utf8.decode(resp.bodyBytes));
      isloading = false;
      notifyListeners();
      return searches.search;
    }
  }

  Future<bool> addFavorite(int id_restaurant, int id_user) async{

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final Map<String, dynamic> data = {
      "id_user": id_user.toString(),
      "id_restaurant": id_restaurant.toString()
    };

    final url = Uri.http(_baseUrl, "/suggestions/favorites/");
    final resp = await http.post(url, body: data);
    final Map<String, dynamic> decodedResp = json.decode(utf8.decode(resp.bodyBytes));
    print("Codigo: " + decodedResp["code"].toString());
    if(decodedResp["code"] == 1){
      notifyListeners();
      return true;
    }else{
      notifyListeners();
      return false;
    }
  }


  void getSugestionByQuery(String search){
    debouncer.value = '';
    debouncer.onValue = (value)async{
      final results = await this.searchRestaurants(value);
      this._streamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) { 
      debouncer.value = search;
    });

    Future.delayed(Duration(milliseconds: 301 )).then((value) => timer.cancel());
  }



}