import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider with ChangeNotifier {
  AppThemeProvider() {
    getPreference();
  }

  bool _isDarkMode = false;

  bool get isDark => _isDarkMode;

  void getPreference() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _isDarkMode = _prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  void toggleTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    _prefs.setBool('isDark', _isDarkMode);
    notifyListeners();
  }
}
