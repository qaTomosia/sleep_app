part of 'configs.dart';

class ThemeConfig {
  static final ThemeConfig _instance = ThemeConfig._internal();

  factory ThemeConfig() => _instance;

  ThemeConfig._internal();

  static ThemeData defaultTheme = _lightTheme;

  static final _lightTheme = ThemeData(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    backgroundColor: Colors.black,
    brightness: Brightness.dark,
  );

  ThemeData changeTheme() {
    return ThemeData().brightness == Brightness.dark ? _lightTheme : _darkTheme;
  }
}