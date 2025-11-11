import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeHandler extends ChangeNotifier {
  static const _key = 'THEME_KEY';
  late SharedPreferences _prefs;
  ThemeMode defaultThemeMode = ThemeMode.system;

  /// Initialize the theme mode from SharedPreferences
  Future<void> themeModeInit() async {
    _prefs = await SharedPreferences.getInstance();
    final currentTheme = _prefs.getString(_key);

    if (currentTheme != null) {
      switch (currentTheme) {
        case 'ThemeMode.light':
          defaultThemeMode = ThemeMode.light;
          break;
        case 'ThemeMode.dark':
          defaultThemeMode = ThemeMode.dark;
          break;
        default:
          defaultThemeMode = ThemeMode.system;
      }
    }
    notifyListeners();
  }

  /// Update theme and persist it
  Future<void> setMode(ThemeMode mode) async {
    defaultThemeMode = mode;
    notifyListeners();

    if (mode == ThemeMode.system) {
      await _prefs.remove(_key);
    } else {
      await _prefs.setString(_key, mode.toString());
    }
  }

    /// Public method to set theme mode
  void setThemeMode(ThemeMode thememode) {
    switch (thememode) {
      case ThemeMode.light:
        setMode(ThemeMode.light);
        break;
      case ThemeMode.dark:
        setMode(ThemeMode.dark);
        break;
      default:
        setMode(ThemeMode.system);
    }
  }
}
