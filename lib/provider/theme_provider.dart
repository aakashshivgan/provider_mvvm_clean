import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _theme = ThemeMode.light;
  ThemeMode get themeMode => _theme;

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void setTheme(thememode) {
    _theme = themeMode;

    notifyListeners();
    print(_theme);
  }

  void toggleDark() {
    _isDarkMode = !_isDarkMode;
    print(_isDarkMode);
    notifyListeners();
  }
}
