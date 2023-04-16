import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/consts.dart';
import '../../main.dart';

//These string are for shared pref
const String mainCodeStringKey = "mainCodeStringKey";

class CodeCubit extends Cubit<CodeState> {
  CodeCubit() : super(CodeInitialState());

  //This string is for sending codes as argument
  static String? codeCubitCodeString ;

  //This getter will get the mainEditorCode from the device shared pref
  static String getMainEditorCode() {
    return pref.getString(mainCodeStringKey) ?? "NO String found";
  }

  //This method will save the code in sharedPref
  void saveMainEditorCode({required String codeText}) {
    debugPrint("Main Editor code Saved");
    pref.setString(mainCodeStringKey, codeText);
  }

  @override
  Future<void> close() {
    codeCubitCodeString = null;
    return super.close();
  }
}

//These are the state classes for this cubit
abstract class CodeState {}

class CodeInitialState extends CodeState {}
