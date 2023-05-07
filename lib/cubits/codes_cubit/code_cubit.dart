import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/themes/ascetic.dart';
import 'package:flutter_highlight/themes/default.dart';
import 'package:flutter_highlight/themes/hybrid.dart';
import 'package:flutter_highlight/themes/idea.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/ocean.dart';
import 'package:flutter_highlight/themes/isbl-editor-light.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../constants/consts.dart';
import '../../main.dart';

//These strings are for shared pref
const String mainCodeStringKey = "mainCodeStringKey";
const String currentCodeDarkThemeStringKey = "currentCodeDarkThemeKey";
const String currentCodeLightThemeStringKey = "currentCodeLightThemeKey";
const String wrapCodeSettingStringKey = "wrapCodeSettingStringKey";

class CodeCubit extends Cubit<CodeState> {
  CodeCubit() : super(CodeInitialState());

  //This string is for sending codes as argument
  static String? codeCubitCodeString;

  // This method will add the boiler plate code if it's not there.
  static String addBoilerPlateCode(String codeExample) {
    if (!codeExample.contains("<!DOCTYPE html>", 0)) {
      const String preCode = '''<!DOCTYPE html>
  <html>
    <head>
        <title>Web page Title</title>
    </head>
 <body>
''';
      const String postCode = '''
 </body>
 </html>''';

      return "$preCode\t      $codeExample\n$postCode";
    } else {
      return codeExample;
    }
  }

  final WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();

  // to save image bytes of widget
  Uint8List? bytes;

//This method will capture the certificateWidget and convert it into image
  Future<Uint8List?> captureResultWidget(
      {required BuildContext context}) async {
    final imageBytes = await widgetsToImageController.capture();
    bytes = imageBytes;
    if (bytes == null) return null;
    await saveResultImage(bytes!).then((val) {
      if (val.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Result Image downloaded successfully!",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Failed to save Result Image!",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
      return "_";
    });
    return bytes;
  }

  //This method will save the result Image in gallery
  Future<String> saveResultImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  //This method will share the certificate
  Future<void> saveAndShareResultImage({required BuildContext context}) async {
    late final Uint8List imageBytes;
    final directory =
        await getApplicationDocumentsDirectory().then((val) async {
      imageBytes = (await captureResultWidget(context: context))!;
      return val;
    });
    final image = File('${directory.path}/resultImage.png');
    image.writeAsBytesSync(imageBytes);
    const text =
        'I have learnt to make this design in HTML from this app , You can also learn HTML from this app. Get the application from here - (link)';
    await Share.shareXFiles([XFile(image.path)], text: text);
  }

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
  String getCurrentCodeThemeName({bool? isDarkMode}) {
    if (isDarkMode != null && !isDarkMode) {
      return pref.getString(currentCodeLightThemeStringKey) ?? "Isbl";
    } else {
      return pref.getString(currentCodeDarkThemeStringKey) ?? "vs2015";
    }
  }

  //This method will get the card color according to the theme
  Color getCardColorAccordingToTheme({required bool isDarkMode}) {
    switch (getCurrentCodeThemeName(isDarkMode: isDarkMode)) {
      case 'vs2015':
        return const Color(0xff1E1E1E);
      case 'Monokai':
        return const Color(0xff23251E);
      case 'Hybrid':
        return const Color(0xff1E1F21);
      case 'Ocean':
        return const Color(0xff2D313B);
      case 'Isbl':
        return const Color(0xffFEFFFE);
      case 'Idea':
        return const Color(0xffFEFFFE);
      case 'Ascetic':
        return const Color(0xffFEFFFE);
      case 'Default':
        return const Color(0xffF1F1F0);
      default:
        return const Color(0xff1E1E1E);
    }
  }

  Map<String, TextStyle> getCurrentCodeTheme({required bool isDarkMode}) {
    switch (getCurrentCodeThemeName(isDarkMode: isDarkMode)) {
      case 'vs2015':
        return vs2015Theme;
      case 'Monokai':
        return monokaiSublimeTheme;
      case 'Hybrid':
        return hybridTheme;
      case 'Ocean':
        return oceanTheme;
      case 'Isbl':
        return isblEditorLightTheme;
      case 'Idea':
        return ideaTheme;
      case 'Ascetic':
        return asceticTheme;
      case 'Default':
        return defaultTheme;
      default:
        return monokaiSublimeTheme;
    }
  }

  //This method will change the wrap code switch setting
  void changeWrapCodeSetting(bool isOn) {
    if (isOn) {
      pref.setBool(wrapCodeSettingStringKey, isOn);
    } else {
      pref.setBool(wrapCodeSettingStringKey, isOn);
    }
    emit(CodeWrapSettingChangedState());
    emit(CodeThemeCardOpenState());
  }

  //This getter will get the current switch state
  bool getWrapCodeCurrentSetting() {
    return pref.getBool(wrapCodeSettingStringKey) ?? false;
  }

  void changeCodeTheme(String codeThemeName, {required bool isDarkMode}) {
    if (isDarkMode) {
      pref.setString(currentCodeDarkThemeStringKey, codeThemeName);
    } else {
      pref.setString(currentCodeLightThemeStringKey, codeThemeName);
    }
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
  void shareCodeResult() {}

  @override
  Future<void> close() {
    codeCubitCodeString = null;
    return super.close();
  }
}

List<String> darkCodeThemesList = ['vs2015', 'Monokai', 'Hybrid', 'Ocean'];
List<String> lightCodeThemesList = ['Isbl', 'Idea', 'Ascetic', 'Default'];

// vs2015 (default), monokai-sublime, hybrid, ocean
// Isbl editor light, idea, ascetic, default
//These are the state classes for this cubit
abstract class CodeState {}

class CodeInitialState extends CodeState {}

class CodeThemeCardOpenState extends CodeState {}

class CodeThemeCardCloseState extends CodeState {}

class CodeThemeChangedState extends CodeState {}

class CodeWrapSettingChangedState extends CodeState {}
