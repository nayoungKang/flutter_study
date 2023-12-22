import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeConfigRepository {
  static const String _darkTheme = "darktheme";

  final SharedPreferences _preferences;

  DarkThemeConfigRepository(this._preferences);

  Future<void> setDark(bool value) async {
    _preferences.setBool(_darkTheme, value);
  }

  bool isDark() {
    return _preferences.getBool(_darkTheme) ?? false;
  }
}
