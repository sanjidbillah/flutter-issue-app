import 'package:flutter/material.dart';
import 'package:fly/utility/constants/keys.dart';
import 'package:fly/utility/shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class ThemeController with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  String currentTheme = 'light';
  ThemeController();
  getTheme() => _themeData;
  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }

  setCurrentTheme(theme) {
    currentTheme = theme;

    notifyListeners();
  }

  static initTheme(context) {
    SharedPreferenceService.getString(key: Keys.theme).then((value) {
      if (value == 'dark') {
        final theme = Provider.of<ThemeController>(context, listen: false);
        theme.setTheme(ThemeData.dark());
        theme.setCurrentTheme('dark');
      }
    });
  }

  toggleTheme() {
    SharedPreferenceService.getString(key: Keys.theme).then((value) {
      if (value == 'dark') {
        setTheme(ThemeData.light());
        setCurrentTheme('light');
        SharedPreferenceService.setString(key: Keys.theme, value: 'light');
      } else {
        setTheme(ThemeData.dark());
        setCurrentTheme('dark');
        SharedPreferenceService.setString(key: Keys.theme, value: 'dark');
      }
    });
  }
}
