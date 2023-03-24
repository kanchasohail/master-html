import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/consts.dart';
import '../../main.dart';

//String for shared-pref
const String isDarkThemeString = "isDarkTheme";

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme(bool isOn) {
    if (isOn) {
      pref.setBool(isDarkThemeString, true);
      emit(ThemeDarkState());
    } else {
      pref.setBool(isDarkThemeString, false);
      emit(ThemeLightState());
    }
  }

  void getInitialTheme(SharedPreferences pref) {
    final bool isDarkTheme = pref.getBool(isDarkThemeString) ?? true;
    if (isDarkTheme == true) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }
}

// These are the theme states
abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeDarkState extends ThemeState {}

class ThemeLightState extends ThemeState {}
