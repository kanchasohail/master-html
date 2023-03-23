import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/consts.dart';
import '../../main.dart';



class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  ThemeMode themeMode = ThemeMode.system;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme( bool? isOn) {
    // themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    if (isOn == true && isOn != null) {
      themeMode = ThemeMode.dark ;
      pref.setString(currentThemeString, darkThemeString);
      emit(ThemeDarkState());
    } else if (isOn == false && isOn != null){
      themeMode = ThemeMode.light ;
      pref.setString(currentThemeString, lightThemeString);
      emit(ThemeLightState());
    }else if(isOn == null){
      themeMode = ThemeMode.system ;
      pref.setString(currentThemeString, systemThemeString);
      emit(ThemeSystemState());
    }
  }

  void getInitialTheme(SharedPreferences pref) {
    final String currTheme = pref.getString(currentThemeString).toString();
    if (currTheme == "null") {
      themeMode = ThemeMode.system;
    } else if (currTheme == lightThemeString) {
      themeMode = ThemeMode.light;
    } else if (currTheme == darkThemeString) {
      themeMode = ThemeMode.dark;
    }
  }
}

// These are the theme states
abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeDarkState extends ThemeState {}

class ThemeLightState extends ThemeState {}

class ThemeSystemState extends ThemeState{}
