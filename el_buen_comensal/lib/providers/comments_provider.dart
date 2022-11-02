import 'package:el_buen_comensal/models/Calification.dart';
import '../models/Comments.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:el_buen_comensal/share%20preferences/Preferences.dart';



class CommentsProvider extends ChangeNotifier {

 final String _baseUrl = '129.151.106.64:8000';

  List<Comment> prueba = [];
  bool isloading = true;

  CommentsProvider() {

    this.getComments();

  }

  Future<List<Comment>> getComments() async {

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final url = Uri.http(_baseUrl, "/suggestions/comments_list_restaurant/"+ Preferences.GetIdUser.toString() + "/");
    final resp = await http.get(url, headers: header);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp["message"].toString());
    if(decodedResp["message"].toString() != "null"){
      List<Comment> no_cali = [];
      return no_cali;
    }else{
      final comments = Comments.fromJson(utf8.decode(resp.bodyBytes));
      prueba = comments.comments;
      isloading = false;
      notifyListeners();
      return prueba;
    }
  }
}