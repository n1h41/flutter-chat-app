import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
// ignore: non_constant_identifier_names
String ONBOARDING_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppController with ChangeNotifier {
  late final SharedPreferences _prefs;
  bool _isLoggedIn = false;
  bool _initialized = false;
  bool _onboardingComplete = false;

  AppController(SharedPreferences prefs) : _prefs = prefs;

  bool get loginState => _isLoggedIn;
  bool get initialized => _initialized;
  bool get onboarding => _onboardingComplete;

  set loginState(bool value) {
    _isLoggedIn = value;
    _prefs.setBool(LOGIN_KEY, value);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    _onboardingComplete = value;
    notifyListeners();
  }

  void init() {
    _onboardingComplete = _prefs.getBool(ONBOARDING_KEY) ?? false;
    _isLoggedIn = _prefs.getBool(LOGIN_KEY) ?? false;
    _initialized = true;
    notifyListeners();
  }
}
