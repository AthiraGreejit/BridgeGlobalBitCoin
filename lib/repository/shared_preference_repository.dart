import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferenceBase {
  Future<String> getToken();

  Future<void> setToken(String token);
}

class CommonSharedPreference implements SharedPreferenceBase {
  @override
  Future<String> getToken() async => SharedPreferenceRepository.getToken();

  @override
  Future<void> setToken(String token) async =>
      SharedPreferenceRepository.setToken(token);
}

class SharedPreferenceRepository {
  static const String KEY_TOKEN = "KEY_TOKEN";

  static Future<void> setToken(String token) async {
    debugPrint("setToken: $token");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(KEY_TOKEN, token);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(KEY_TOKEN) ?? "";
    debugPrint("getToken: $token");
    return token;
  }
}
