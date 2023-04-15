import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';


//These string are for shared pref
const String mainCodeStringKey = "mainCodeString";
class CodeCubit extends Cubit<CodeState>{
  CodeCubit():super(CodeInitialState());
  static String codeCubitCodeString = "";

  static String get getMainEditorCode{
    return pref.getString(mainCodeStringKey) ?? "";
  }

  @override
  Future<void> close() {
    codeCubitCodeString = "";
    return super.close();
  }
}

//These are the state classes for this cubit
abstract class CodeState{}
class CodeInitialState extends CodeState{}
