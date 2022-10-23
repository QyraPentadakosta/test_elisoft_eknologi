import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IConstants {
  static const double padding = 8;
  static const name = "name";

  Future<bool> setString(String key, String? value) async {
    var pref = await SharedPreferences.getInstance();
    var success = await pref.setString(key, value ?? "");
    if (kDebugMode) {
      print("Saving $key is $success");
    }
    return success;
  }

  Future<String?> getString(String key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    return val ?? "";
  }
}
