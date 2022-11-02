
import 'dart:io';

import 'package:el_buen_comensal/models/Calification.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalificationProvider extends ChangeNotifier {

 final String _baseUrl = '129.151.106.64:8000';

  List<Calification> prueba = [];
  bool isloading = true;


  Future<List<Calification>> getCalifications(int id_restaurant) async {

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final url = Uri.http(_baseUrl, "/suggestions/score_list_restaurant/"+ id_restaurant.toString() + "/");
    final resp = await http.get(url, headers: header);
    final Map<String, dynamic> decodedResp = json.decode(utf8.decode(resp.bodyBytes));
    print(decodedResp["message"].toString());
    if(decodedResp["message"].toString() != "null"){
      List<Calification> no_cali = [];
      return no_cali;
    }else{
      final califications = Califications.fromJson(utf8.decode(resp.bodyBytes));
      prueba = califications.calification;
      isloading = false;
      notifyListeners();
      return prueba;
    }
  }
}