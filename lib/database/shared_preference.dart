import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  factory UserPreferences() => _instance;
  UserPreferences._internal();
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setStringValue(String key, String value) async {
    _prefs.setString(key, value);
  }

  Future<String> getStringValue(String key) async {
    return _prefs.getString(key) ?? "";
  }

  setBoolValue(String key, bool value) async {
    _prefs.setBool(key, value);
  }

  Future<bool> getBoolValue(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  Future close() async {
    _prefs.clear();
  }
}
