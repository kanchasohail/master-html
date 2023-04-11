import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';

// This is for shared pref
const String savedFontSizeStringKey = "savedFontSize";

class FontSizeCubit extends Cubit<FontSizeState> {
  FontSizeCubit() : super(FontSizeInitialState());

  int get getCurrentFontSize {
    final int fontSize = pref.getInt(savedFontSizeStringKey) ?? 18;
    return fontSize;
  }

  void changeFontSize(int fontSize) {
    pref.setInt(savedFontSizeStringKey, fontSize);
    emit(FontSizeChangedState());
  }
}

//This is the list of available font size options
const List<int> fontSize = [
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30
];

// These are the states fot font size cubit
abstract class FontSizeState {}

class FontSizeInitialState extends FontSizeState {}

class FontSizeChangedState extends FontSizeState {}
