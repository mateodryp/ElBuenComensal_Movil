import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _id_user = "";
  static String _token = "";
  static String _name = "";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get GetNameUser {
    return _prefs.getString("name") ?? "";
  }

  static String get GetIdUser {
    return _prefs.getString("id_user") ?? "";
  }

  static String get GetToken {
    return _prefs.getString("token") ?? "";
  }

  static set SetNameUser(String name) {
    _name = name;
    _prefs.setString("name", _name);
  }

  static set SetIdUse(String id) {
    _id_user = id;
    _prefs.setString("id_user", _id_user);
  }

  static set SetToken(String token) {
    _token = token;
    _prefs.setString("token", _token);
  }
}
