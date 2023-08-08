import 'package:flutter/material.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/domain/usecase/app_preferences/get_dark_mode_pref_uc.dart';
import 'package:flutter_sample/domain/usecase/app_preferences/set_dark_mode_pref_uc.dart';

class AppProvider extends ChangeNotifier {
  final _setDarkModeUseCase = locator<SetDarkModeUseCase>();
  final _getDarkModeUseCase = locator<GetDarkModeUseCase>();

  final snackBarTheme = const SnackBarThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
  );

  late final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    snackBarTheme: snackBarTheme,
  );

  late final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    snackBarTheme: snackBarTheme,
  );

  late ThemeData _appTheme =
      _getDarkModeUseCase.run() ? _darkTheme : _lightTheme;

  ThemeData get appTheme => _appTheme;

  ThemeData get darkTheme => _darkTheme;

  void changeTheme() async {
    _appTheme =
        _appTheme.brightness == Brightness.light ? _darkTheme : _lightTheme;
    _setDarkModeUseCase.run(_appTheme.brightness == Brightness.dark);
    notifyListeners();
  }

  void updateThemeFont() {
    notifyListeners();
  }
}
