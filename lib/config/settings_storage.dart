import 'package:shared_preferences/shared_preferences.dart';

import 'theme.dart';

abstract class Keys {
  static const String themeKey = 'theme';
  static const String fontSizeKey = 'font_size';
}

// ignore: avoid_classes_with_only_static_members
class SettingsStorage {
  static late SharedPreferences _storage;

  static Future<dynamic> init() async {
    _storage = await SharedPreferences.getInstance();
  }

  static String readTheme() {
    final storage = _storage;
    final theme = storage.getString(Keys.themeKey);
    return theme ?? ThemeEnam().themeColorFromEnum(AppTheme.colorTheme);
  }

  static Future<dynamic> setTheme(String theme) async {
    final storage = _storage;
    await storage.setString(Keys.themeKey, theme);
  }


    static double readFontSize() {
    final storage = _storage;
    final size = storage.getDouble(Keys.fontSizeKey);
    return size ?? 18;
  }

  static Future<dynamic> setFontSize(double fontSize) async {
    final storage = _storage;
    final size = await storage.setDouble(Keys.fontSizeKey, fontSize);
    return size;
  }
}


