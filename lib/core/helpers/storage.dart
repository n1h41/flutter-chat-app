import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  late SharedPreferences _prefs;

  static final Storage _instance = Storage._();

  SharedPreferences get prefs => _prefs;

  factory Storage() => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  T? getValue<T>(String key) {
    return _prefs.get(key) as T;
  }

  Future<void> setValue<T>(String key, T value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    }
  }

  Future<void> removeValue(String key) async {
    await _prefs.remove(key);
  }
}
