import 'package:flutter/material.dart';

class AppThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDark => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
