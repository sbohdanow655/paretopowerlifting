import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeManager _instance;
  static bool _isDarkMode = false;

  static ThemeManager getInstance() {
    if (_instance == null) {
      _instance = ThemeManager();
    }
    return _instance;
  }

  set isDarkMode(bool val) {
    _isDarkMode = val;
  }

  static const MaterialColor LIGHT_MATERIAL_PRIMARY = const MaterialColor(
    0xFF2196F3,
    const <int, Color>{
      50: LIGHT_PRIMARY,
      100: LIGHT_PRIMARY,
      200: LIGHT_PRIMARY,
      300: LIGHT_PRIMARY,
      400: LIGHT_PRIMARY,
      500: LIGHT_PRIMARY,
      600: LIGHT_PRIMARY,
      700: LIGHT_PRIMARY,
      800: LIGHT_PRIMARY,
      900: LIGHT_PRIMARY
    },
  );

  static const Color LIGHT_BACKGROUND = Color(0xfff5f5f5);
  static const Color LIGHT_CONTAINER_BACKGROUND = Colors.white;
  static const Color LIGHT_PRIMARY = Color(0xff2196F3);
  static const Color LIGHT_DIVIDER = Color(0xffBDBDBD);
  static const Color LIGHT_PRIMARY_TEXT = Color(0xff212121);
  static const Color LIGHT_SECONDARY_TEXT = Color(0xff757575);

  static const MaterialColor DARK_MATERIAL_PRIMARY = const MaterialColor(
    0xFF2196F3,
    const <int, Color>{
      50: DARK_PRIMARY,
      100: DARK_PRIMARY,
      200: DARK_PRIMARY,
      300: DARK_PRIMARY,
      400: DARK_PRIMARY,
      500: DARK_PRIMARY,
      600: DARK_PRIMARY,
      700: DARK_PRIMARY,
      800: DARK_PRIMARY,
      900: DARK_PRIMARY
    },
  );

  static const Color DARK_BACKGROUND = Color(0xfff5f5f5);
  static const Color DARK_CONTAINER_BACKGROUND = Colors.white;
  static const Color DARK_PRIMARY = Color(0xff2196F3);
  static const Color DARK_DIVIDER = Color(0xffBDBDBD);
  static const Color DARK_PRIMARY_TEXT = Color(0xff212121);
  static const Color DARK_SECONDARY_TEXT = Color(0xff757575);

  Color getBackgroundColor() {
    if (_isDarkMode) {
      return DARK_BACKGROUND;
    }

    return LIGHT_BACKGROUND;
  }

  Color getContainerBackgroundColor() {
    if (_isDarkMode) {
      return DARK_CONTAINER_BACKGROUND;
    }

    return LIGHT_CONTAINER_BACKGROUND;
  }

  Color getPrimaryColor() {
    if (_isDarkMode) {
      return DARK_PRIMARY;
    }

    return LIGHT_PRIMARY;
  }

  Color getDividerColor() {
    if (_isDarkMode) {
      return DARK_DIVIDER;
    }

    return LIGHT_DIVIDER;
  }

  Color getPrimaryTextColor() {
    if (_isDarkMode) {
      return DARK_PRIMARY_TEXT;
    }

    return LIGHT_PRIMARY_TEXT;
  }

  Color getSecondaryTextColor() {
    if (_isDarkMode) {
      return DARK_SECONDARY_TEXT;
    }

    return LIGHT_SECONDARY_TEXT;
  }

  MaterialColor getMaterialPrimaryColor() {
    if (_isDarkMode) {
      return DARK_MATERIAL_PRIMARY;
    }

    return LIGHT_MATERIAL_PRIMARY;
  }
}
