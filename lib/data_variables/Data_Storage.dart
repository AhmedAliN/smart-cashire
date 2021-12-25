

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';

class DataStorage {
  static String idKey = 'ID';
  static String loginKey = 'LOGIN';
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  DataStorage();

  static setInt(key, value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }

  static getInt() async {
    final SharedPreferences prefs = await _prefs;
    return user.id = prefs.getString(idKey) ?? -1;
  }

  static setbool(key, value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }
  static getbool(key) async {
    final SharedPreferences prefs = await _prefs;
   return prefs.getBool(key) ?? false;
  }

  static setString(key, value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  static getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }
}
