import 'package:el_buen_comensal/models/User.dart';
import 'package:el_buen_comensal/providers/user_info_provider.dart';
import 'package:el_buen_comensal/share%20preferences/Preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class UserServices extends ChangeNotifier {
  final String _baseUrl = '144.22.197.146:8000';
  final UserInfoProvider userProvider = UserInfoProvider();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserInfoProvider>(context);
    return Container();
  }

  Future<String> createUser(String nombres, String apellidos, String correo,
      String telefono, String contrasena, String edad) async {
    final Map<String, dynamic> data = {
      "name": nombres,
      "last_name": apellidos,
      "age": edad,
      "email": correo,
      "password": contrasena,
      "phone_number": telefono,
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final url = Uri.http(_baseUrl, "/users/commensal/");
    final resp = await http.post(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    return decodedResp["code"].toString();
  }

  Future<User> loginUser(String correo, String contrasena) async {
    final Map<String, dynamic> data = {
      "email": correo,
      "password": contrasena,
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final url = Uri.http(_baseUrl, "/users/login/");
    final resp = await http.post(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp["code"].toString() == "1"){
      Preferences.SetIdUse = decodedResp["id_user"].toString();
      Preferences.SetToken = decodedResp["token"];
      return User(age: decodedResp["age"],code: decodedResp["code"],email: decodedResp["email"], idCommensal: decodedResp["id_commensal"], idUser: decodedResp["id_user"], lastName: decodedResp["last_name"], name: decodedResp["name"],  phoneNumber: decodedResp["phone_number"],token: decodedResp["token"], userNew: decodedResp["new"] );
    }else{
      return User(age: 1,code: decodedResp["code"],email: "", idCommensal: 0, idUser: 0, lastName: "", name: "",  phoneNumber: "",token: "", userNew: false);
    }
    
  }

  Future<User> checkSession(int id_user , String token) async {
    final Map<String, dynamic> data = {
      "token": token,
      "user_id": id_user,
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final url = Uri.http(_baseUrl, "/users/validate_token/");
    final resp = await http.post(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp["code"].toString() == "1"){
      return User(age: decodedResp["age"],code: decodedResp["code"],email: decodedResp["email"], idCommensal: decodedResp["id_commensal"], idUser: decodedResp["id_user"], lastName: decodedResp["last_name"], name: decodedResp["name"],  phoneNumber: decodedResp["phone_number"],token: decodedResp["token"], userNew: decodedResp["new"] );
    }else{
      return User(age: 1,code: decodedResp["code"],email: "", idCommensal: 0, idUser: 0, lastName: "", name: "",  phoneNumber: "",token: "", userNew: false);
    }
    
  }

  Future<bool> giveInformation(int id_user ,bool isVegan, String interest, String enviroment) async {
    
    final Map<String, dynamic> data = {
      "user_id": id_user,
      "vegetarian": isVegan,
      "interest": interest,
      "environment": enviroment,
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final url = Uri.http(_baseUrl, "/users/update_info/");
    final resp = await http.put(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp["code"].toString() == "1"){
      return true;
    }else{
      return false;
    }
    
  }

  Future<bool> giveSuggestion(int id_user ,int id_restaurant, String suggestion) async {
    
    if(suggestion == ""){
      return false;
    }

    final Map<String, dynamic> data = {
      "id_user": id_user,
      "id_restaurant": id_restaurant,
      "comment": suggestion,
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    print(id_user);
    print(id_restaurant);
    print(suggestion);


    final url = Uri.http(_baseUrl, "/suggestions/comments/");
    final resp = await http.post(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp["code"].toString() == "1"){
      return true;
    }else{
      return false;
    }

    
  }

  Future<bool> giveCalifitation(int id_user ,int id_restaurant, String comments, int calification) async {
    
    if(comments == ""){
      return false;
    }

    final Map<String, dynamic> data = {
      "id_user": id_user,
      "id_restaurant": id_restaurant,
      "punctuation": calification,
      "comment": comments,
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    print(id_user);
    print(id_restaurant);
    print(comments);
    print(calification);

    final url = Uri.http(_baseUrl, "/suggestions/score/");
    final resp = await http.post(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp["code"].toString() == "1"){
      return true;
    }else{
      return false;
    }
    
  }

  Future<bool> changePassword(int id_user , String password) async {

    final Map<String, dynamic> data = {
      "id_user": id_user,
      "password": password
    };

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    print(id_user);
    print(password);

    return true;

    
    /*final url = Uri.http(_baseUrl, "/suggestions/score/");
    final resp = await http.post(url, body: json.encode(data), headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    if(decodedResp["code"].toString() == "1"){
      return true;
    }else{
      return false;
    }*/
    
  }

}
