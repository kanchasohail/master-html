import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';
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

  void toggleTheme(bool isOn , {required BuildContext ctx}) {
    final codeCubit = BlocProvider.of<CodeCubit>(ctx);
    if (isOn) {
      pref.setBool(isDarkThemeStringKey, true);
      codeCubit.changeCodeTheme(codeCubit.getCurrentCodeThemeName(isDarkMode: true) , isDarkMode: true);
      emit(ThemeDarkState());
    } else {
      pref.setBool(isDarkThemeStringKey, false);
      codeCubit.changeCodeTheme(codeCubit.getCurrentCodeThemeName(isDarkMode: false) , isDarkMode: false);
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
