import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String? get(String key) {
    return prefs.getString(key);
  }

  static clear(String key) async {
    await prefs.remove(key);
  }

  static set(String key, String value) async {
    await prefs.setString(key, value);
  }

  static Future<List> loadList(String key) async {
    var str = DBService.get(key) ?? "[]";
    return jsonDecode(str);
  }

  static Future saveList(String key, List values) async {
    await DBService.set(key, jsonEncode(values));
  }
}
