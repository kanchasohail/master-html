import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/consts.dart';
import '../../main.dart';

//These string are for shared preferences
const String isGetStartedKey = "isGetStarted" ;
const String isDarkThemeStringKey = "isDarkTheme";

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  ThemeMode themeMode = ThemeMode.system;

  //These two for checking if the learning was started or not
  bool isGetStarted() {
    return pref.getBool(isGetStartedKey) ?? true;
  }

  void updateIsGetStarted() {
    if (pref.getBool(isGetStartedKey) == false) {
      emit(ThemeInitialState());
    } else {
      return;
    }
  }

  void toggleTheme(bool isOn) {
    if (isOn) {
      pref.setBool(isDarkThemeStringKey, true);
      emit(ThemeDarkState());
    } else {
      pref.setBool(isDarkThemeStringKey, false);
      emit(ThemeLightState());
    }
  }

  void getInitialTheme(SharedPreferences pref) {
    final bool isDarkTheme = pref.getBool(isDarkThemeStringKey) ?? true;
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
