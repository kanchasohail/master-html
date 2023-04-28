import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/vs.dart';

import '../../constants/consts.dart';
import '../../main.dart';

//These strings are for shared pref
const String mainCodeStringKey = "mainCodeStringKey";
const String currentCodeThemeStringKey = "currentCodeThemeKey";
const String wrapCodeSettingStringKey = "wrapCodeSettingStringKey";

class CodeCubit extends Cubit<CodeState> {
  CodeCubit() : super(CodeInitialState());

  //This string is for sending codes as argument
  static String? codeCubitCodeString;

  //This getter will get the mainEditorCode from the device shared pref
  static String getMainEditorCode() {
    return pref.getString(mainCodeStringKey) ?? "";
  }

  //This method will save the code in sharedPref
 static void saveMainEditorCode({required String codeText}) {
    debugPrint("Main Editor code Saved");
    pref.setString(mainCodeStringKey, codeText);
  }

  //This method will get the current code theme name
  String getCurrentCodeThemeName() {
    return pref.getString(currentCodeThemeStringKey) ?? "";
  }

  Map<String, TextStyle> getCurrentCodeTheme() {
    switch (getCurrentCodeThemeName()) {
      case 'Atom':
        return atomOneLightTheme;
      case 'Monokai-subline':
        return monokaiSublimeTheme;
      case 'VS':
        return vsTheme;
      case 'Darcula':
        return darculaTheme;
      default:
        return monokaiSublimeTheme;
    }
  }
  //This method will change the wrap code switch setting
  void changeWrapCodeSetting(bool isOn){
    if(isOn){
      pref.setBool(wrapCodeSettingStringKey, isOn);
    }else{
      pref.setBool(wrapCodeSettingStringKey, isOn);
    }
    emit(CodeWrapSettingChangedState());
    emit(CodeThemeCardOpenState());
  }
  //This getter will get the current switch state
  bool getWrapCodeCurrentSetting(){
    return pref.getBool(wrapCodeSettingStringKey) ?? false ;
}

  void changeCodeTheme(String codeThemeName) {
    pref.setString(currentCodeThemeStringKey, codeThemeName);
    emit(CodeThemeChangedState());
    emit(CodeThemeCardOpenState());
  }

  bool isCardOpen = false;

  //This method will pop up the card
  void popUpCard() {
    if (!isCardOpen) {
      isCardOpen = true;
      emit(CodeThemeCardOpenState());
    } else {
      isCardOpen = false;
      emit(CodeThemeCardCloseState());
    }
  }


  //This method will share the code result in image form
  void shareCodeResult(){

  }

  @override
  Future<void> close() {
    codeCubitCodeString = null;
    return super.close();
  }
}

List<String> codeThemesList = ['Atom', 'Monokai-subline', 'VS', 'Darcula'];

//These are the state classes for this cubit
abstract class CodeState {}

class CodeInitialState extends CodeState {}

class CodeThemeCardOpenState extends CodeState {}

class CodeThemeCardCloseState extends CodeState {}

class CodeThemeChangedState extends CodeState {}
class CodeWrapSettingChangedState extends CodeState {}
