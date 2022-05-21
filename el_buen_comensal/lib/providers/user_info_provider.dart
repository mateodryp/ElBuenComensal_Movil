import 'package:el_buen_comensal/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
