import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';

// These Strings are for shared pref
const String savedFontSizeStringKey = "savedFontSize";
const String savedFontFamilyString = "savedFontFamily";

class FontsCubit extends Cubit<FontsState> {
  FontsCubit() : super(FontsInitialState()) {
    isLeastFontSize = getCurrentFontSize == 14;
    isHighestFontSize = getCurrentFontSize == 18;
  }

//These booleans are used for the "+" and "-" buttons in the learning screen ;
  bool isLeastFontSize = false;

  bool isHighestFontSize = false;

//This getter will get the current font size from teh sharedPref ;
  int get getCurrentFontSize {
    final int fontSize = pref.getInt(savedFontSizeStringKey) ?? 16;
    return fontSize;
  }

  //This method will be triggered from the learning screen
  void incrementFontSize(int currentFontSize) {
    if (currentFontSize < 18) {
      changeFontSize(currentFontSize + 1);
    }
    return;
  }

//This method will decrement the font size ;
  void decrementFontSize(int currentFontSize) {
    if (currentFontSize > 14) {
      changeFontSize(currentFontSize - 1);
    }
    return;
  }

/*This method will change the font size and this is also triggered from the settings page ;
* And this is responsible for saving the font size in the shared pref*/
  void changeFontSize(int fontSize) {
    if (fontSize == 18) {
      isHighestFontSize = true;
      isLeastFontSize = false;
    } else if (fontSize == 14) {
      isLeastFontSize = true;
      isHighestFontSize = false;
    } else {
      isHighestFontSize = false;
      isLeastFontSize = false;
    }
    pref.setInt(savedFontSizeStringKey, fontSize);
    emit(FontSizeChangedState());
  }

  //This method will change the font family
  void changeFontFamily(String fontFamily) {
    pref.setString(savedFontFamilyString, fontFamily);
    emit(FontFamilyChangedState());
  }
 //This method will get the current font family from the shared pref
  String get getCurrentFontFamily {
    final String fontFamily = pref.getString(savedFontFamilyString) ?? 'Roboto';
    return fontFamily;
  }
}

//This is the list of available font size options
const List<int> fontSizesList = [14, 15, 16, 17, 18];
//This is the list of available font Family options
const List<String> fontFamiliesList = [
  'Roboto',
  'Expletus',
  'Averia',
  'Spline',
];

// These are the states fot font size cubit
abstract class FontsState {}

class FontsInitialState extends FontsState {}

class FontSizeChangedState extends FontsState {}

class FontFamilyChangedState extends FontsState {}
