import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';


class UserNameCubit extends Cubit<UserNameState> {
  UserNameCubit() : super(UserNameInitialState()){
    getUserName();
  }
  static const String userNameStringKey = "userName";

  final TextEditingController nameController = TextEditingController();
  String? userName ;

  void startEditing(){
    nameController.text = userName ?? "";
    emit(UserNameEditingState());
  }

  void saveName(String name){
    pref.setString(userNameStringKey, name);
    getUserName();
    emit(UserNameSaveState());
  }
  void getUserName(){
   userName = pref.getString(userNameStringKey);
  }

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }

}

//These are the states class for this cubit
abstract class UserNameState {}

class UserNameInitialState extends UserNameState {}

class UserNameEditingState extends UserNameState {}

class UserNameSaveState extends UserNameState {}
