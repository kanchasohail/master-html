import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';

// This is for shared pref
const String savedFontSizeStringKey = "savedFontSize";

class FontSizeCubit extends Cubit<FontSizeState> {
  FontSizeCubit() : super(FontSizeInitialState()){
    isLeastSize =   getCurrentFontSize == 14 ;
    isHighestSize = getCurrentFontSize == 18 ;
  }

  bool isLeastSize = false ;
  bool isHighestSize = false ;

  int get getCurrentFontSize {
    final int fontSize = pref.getInt(savedFontSizeStringKey) ?? 18;
    return fontSize;
  }
  //This method will be triggered from the learning screen
  void incrementFontSize(int currentFontSize){
    if(currentFontSize < 18){
      if(currentFontSize + 1 == 18){
        isHighestSize = true ;
      }
      isLeastSize = false ;
      changeFontSize(currentFontSize + 1);
    }
    return ;

  }

  void decrementFontSize(int currentFontSize){
    if(currentFontSize > 14){
      if(currentFontSize - 1 == 14){
        isLeastSize = true ;
      }
      isHighestSize = false ;
      changeFontSize(currentFontSize - 1);
    }
    return ;
  }

//This method will change the font size and this is also triggered from the settings page ;
  void changeFontSize(int fontSize) {
    pref.setInt(savedFontSizeStringKey, fontSize);
    emit(FontSizeChangedState());
  }
}

//This is the list of available font size options
const List<int> fontSize = [
  14,
  15,
  16,
  17,
  18
];

// These are the states fot font size cubit
abstract class FontSizeState {}

class FontSizeInitialState extends FontSizeState {}

class FontSizeChangedState extends FontSizeState {}
