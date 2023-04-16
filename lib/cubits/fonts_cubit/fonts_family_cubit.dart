import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';

// This is for shared pref
const String savedFontFamilyString = "savedFontFamily";

class FontFamilyCubit extends Cubit<FontFamilyState> {
  FontFamilyCubit() : super(FontFamilyInitialState());

  String get getCurrentFontFamily {
    final String fontFamily = pref.getString(savedFontFamilyString) ?? 'Roboto';
    return fontFamily;
  }

  void changeFontFamily(String fontFamily) {
    pref.setString(savedFontFamilyString, fontFamily);
    emit(FontFamilyChangedState());
  }
}

//This is the list of available font Family options
const List<String> fontFamily = [
  'Roboto',
  'RobotoMedium',
  'AnonymousPro',
  'AveriaSans',
  'ExpletusSans',
  'OverpassMono',
  'ShareTechMono',
  'SpaceMono',
  'SplineSans',
  'Arctik1.5',
];

// These are the states fot font size cubit
abstract class FontFamilyState {}

class FontFamilyInitialState extends FontFamilyState {}

class FontFamilyChangedState extends FontFamilyState {}
