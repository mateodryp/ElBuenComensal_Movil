// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        required this.token,
        required this.idUser,
        required this.email,
        required this.name,
        required this.lastName,
        required this.phoneNumber,
        required this.userNew,
        required this.age,
        required this.idCommensal,
        required this.code,
    });

    String token;
    int idUser;
    String email;
    String name;
    String lastName;
    String phoneNumber;
    bool userNew;
    int age;
    int idCommensal;
    int code;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        token: json["token"],
        idUser: json["id_user"],
        email: json["email"],
        name: json["name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        userNew: json["new"],
        age: json["age"],
        idCommensal: json["id_commensal"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "id_user": idUser,
        "email": email,
        "name": name,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "new": userNew,
        "age": age,
        "id_commensal": idCommensal,
        "code": code,
    };
}
