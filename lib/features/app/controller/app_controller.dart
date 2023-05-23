import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
// ignore: non_constant_identifier_names
String ONBOARDING_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppController with ChangeNotifier {
  late final SharedPreferences _prefs;
  final StreamController<bool> _loginStateChange =
      StreamController<bool>.broadcast();
  bool _isLoggedIn = false;
  bool _initialized = false;
  bool _onboardingComplete = false;

  AppController(SharedPreferences prefs) : _prefs = prefs;

  bool get loginState => _isLoggedIn;
  bool get initialized => _initialized;
  bool get onboarding => _onboardingComplete;
  StreamController<bool> get loginStateChange => _loginStateChange;

  set loginState(bool value) {
    _isLoggedIn = value;
    _loginStateChange.add(value);
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

  Future<void> init() async {
    _onboardingComplete = _prefs.getBool(ONBOARDING_KEY) ?? false;
    _isLoggedIn = _prefs.getBool(LOGIN_KEY) ?? false;

    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    _initialized = true;
    notifyListeners();
  }
}
