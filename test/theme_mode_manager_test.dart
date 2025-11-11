import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:theme_mode_manager/theme_mode_manager.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ThemeModeHandler Tests', () {
    late ThemeModeHandler handler;
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      handler = ThemeModeHandler();
      await handler.themeModeInit();
    });
    test('Default theme mode should be system', () {
      expect(handler.defaultThemeMode, ThemeMode.system);
    });
    test('ThemeMode for light theme test', () {
      handler.setThemeMode(ThemeMode.light);
      expect(handler.defaultThemeMode, ThemeMode.light);
    });
    test('ThemeMode for dark theme test', () {
      handler.setThemeMode(ThemeMode.dark);
      expect(handler.defaultThemeMode, ThemeMode.dark);
    });
    test('Set theme mode to system removes saved preference', () async {
      handler.setThemeMode(ThemeMode.light);
      expect(handler.defaultThemeMode, ThemeMode.light);

      handler.setThemeMode(ThemeMode.system);
      expect(handler.defaultThemeMode, ThemeMode.system);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('THEME_KEY'), null);
    });

    test('themeModeInit loads saved preference correctly', () async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('THEME_KEY', ThemeMode.dark.toString());

      final newHandler = ThemeModeHandler();
      await newHandler.themeModeInit();
      expect(newHandler.defaultThemeMode, ThemeMode.dark);
    });
  });
}
