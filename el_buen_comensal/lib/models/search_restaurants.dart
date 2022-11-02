// To parse this JSON data, do
//
//     final searchRestaurants = searchRestaurantsFromMap(jsonString);

import 'dart:convert';

class SearchRestaurants {
    SearchRestaurants({
        required this.search,
    });

    List<Search> search;

    factory SearchRestaurants.fromJson(String str) => SearchRestaurants.fromMap(json.decode(str));


    factory SearchRestaurants.fromMap(Map<String, dynamic> json) => SearchRestaurants(
        search: List<Search>.from(json["search"].map((x) => Search.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "search": List<dynamic>.from(search.map((x) => x.toMap())),
    };
}

class Search {
    Search({
        required this.restaurantId,
        required this.name,
        required this.address,
        required this.prices,
        required this.typeFood,
        required this.menu,
        required this.punctuation,
        required this.schedule,
        required this.description,
        required this.images,
    });

    int restaurantId;
    String name;
    String address;
    double prices;
    String typeFood;
    String menu;
    int punctuation;
    String schedule;
    String description;
    List<String> images;

    factory Search.fromJson(String str) => Search.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Search.fromMap(Map<String, dynamic> json) => Search(
        restaurantId: json["restaurant_id"],
        name: json["name"],
        address: json["address"],
        prices: json["prices"],
        typeFood: json["type_food"],
        menu: json["menu"],
        punctuation: json["punctuation"] == null ? null : json["punctuation"],
        schedule: json["schedule"],
        description: json["description"],
        images:  List<String>.from(json["images"].map((x) => x["imagen"])),
    );

    Map<String, dynamic> toMap() => {
        "restaurant_id": restaurantId,
        "name": name,
        "address": address,
        "prices": prices,
        "type_food": typeFood,
        "menu": menu,
        "punctuation": punctuation == null ? null : punctuation,
        "schedule": schedule,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}