import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  late SharedPreferences _preferences;
  static final PreferenceManager _instance = PreferenceManager._internal();

  PreferenceManager._internal();

  factory PreferenceManager() {
    return _instance;
  }

  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  Future remove(String key) async {
    await _preferences.remove(key);
  }
}
