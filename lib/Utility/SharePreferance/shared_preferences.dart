import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class shared_preferences {
  static shared_preferences shared = shared_preferences();
  setStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  setDoubleToSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  setBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<String> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    return stringValue ?? "";
  }

  getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }

  getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble(key);
    return doubleValue;
  }
  setClassToSF(String key, Map<String, dynamic>? json) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(json));
  }

  Future<Map<String, dynamic>> ClassValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String str = prefs.getString(key) ?? "";
    Map<String, dynamic> json = jsonDecode(str);
    print(json);
    return json;
  }
}
