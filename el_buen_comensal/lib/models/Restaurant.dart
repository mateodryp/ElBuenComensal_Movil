// To parse this JSON data, do
//
//     final restaurants = restaurantsFromMap(jsonString);

import 'dart:convert';

import 'package:diacritic/diacritic.dart';

class Restaurants {
    Restaurants({
        required this.results,
    });

    List<Restaurant> results;

    factory Restaurants.fromJson(String str) => Restaurants.fromMap(json.decode(str));


    factory Restaurants.fromMap(Map<String, dynamic> json) => Restaurants(
        results: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "restaurants": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Restaurant {
    Restaurant({
        required this.idRestaurant,
        required this.name,
        required this.menu,
        required this.address,
        required this.prices,
        required this.typeFood,
        required this.punctuation,
        required this.schedule,
        required this.description,
        required this.images,
    });

    int idRestaurant;
    String name;
    String menu;
    String address;
    double prices;
    String typeFood;
    int punctuation;
    String schedule;
    String description;
    List<String> images;


    factory Restaurant.fromJson(String str) => Restaurant.fromMap(json.decode(str));

    factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        idRestaurant:  json["id_restaurant"],
        name: removeDiacritics(json["name"]),
        menu: json["menu"],
        address: removeDiacritics(json["address"]),
        prices: json["prices"],
        typeFood: removeDiacritics(json["type_food"]),
        punctuation: json["punctuation"],
        schedule: removeDiacritics(json["schedule"]),
        description: removeDiacritics(json["description"]),
        images: List<String>.from(json["images"].map((x) => x["imagen"])),
    );

    Map<String, dynamic> toMap() => {
        "id_restaurant": idRestaurant,
        "name": name,
        "menu": menu,
        "address": address,
        "prices": prices,
        "type_food": typeFood,
        "punctuation": punctuation,
        "schedule": schedule,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

