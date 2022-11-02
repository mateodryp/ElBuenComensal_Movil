// To parse this JSON data, do
//
//     final Califications = welcomeFromMap(jsonString);

import 'dart:convert';

class Califications {
    Califications({
        required this.calification,
    });

    List<Calification> calification;

    factory Califications.fromJson(String str) => Califications.fromMap(json.decode(str));


    factory Califications.fromMap(Map<String, dynamic> json) => Califications(
        calification: List<Calification>.from(json["califications"].map((x) => Calification.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "calification": List<dynamic>.from(calification.map((x) => x.toMap())),
    };
}

class Calification {
    Calification({
        required this.commensal,
        required this.lastName,
        required this.punctuation,
        required this.comment,
        required this.date,
    });

    String commensal;
    String lastName;
    int punctuation;
    String comment;
    String date;

    factory Calification.fromJson(String str) => Calification.fromMap(json.decode(str));


    factory Calification.fromMap(Map<String, dynamic> json) => Calification(
        commensal: json["commensal"],
        lastName: json["last_name"],
        punctuation: json["punctuation"],
        comment: json["comment"],
        date: json["date"],
    );

    Map<String, dynamic> toMap() => {
        "commensal": commensal,
        "last_name": lastName,
        "punctuation": punctuation,
        "comment": comment,
        "date": date,
    };
}
