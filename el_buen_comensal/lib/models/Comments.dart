// To parse this JSON data, do
//
//     final comments = commentsFromMap(jsonString);

import 'dart:convert';

class Comments {
    Comments({
        required this.comments,
    });

    List<Comment> comments;

    factory Comments.fromJson(String str) => Comments.fromMap(json.decode(str));

    factory Comments.fromMap(Map<String, dynamic> json) => Comments(
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
    };
}

class Comment {
    Comment({
        required this.idRestaurant,
        required this.name,
        required this.punctuation,
        required this.comment,
        required this.date,
        required this.imagen,
    });

    int idRestaurant;
    String name;
    int punctuation;
    String comment;
    String date;
    String imagen;

    factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

    factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        idRestaurant: json["id_restaurant"],
        name: json["name"],
        punctuation: json["punctuation"],
        comment: json["comment"],
        date: json["date"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toMap() => {
        "id_restaurant": idRestaurant,
        "name": name,
        "punctuation": punctuation,
        "comment": comment,
        "date": date,
        "imagen": imagen,
    };
}
