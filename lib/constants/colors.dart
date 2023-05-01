import 'package:flutter/material.dart';

const Color redColor = Colors.red;

const Color greenColor = Colors.green;

const Color orangeColor = Colors.orange;

const Color lightBlack = Colors.black54;

//Colors for light theme

const Color lightAppBarColor = Color(0xffFFFFFF);
const Color lightBodyColor = Color(0xffEBEFF4);
const Color lightCardColor = Color(0xffFFFFFF);
const Color lightSettingsHeaderColor = Color(0xffdbdbdb);
const Color lightSettingsOptionColor = Color(0xffFFFFFF);
const Color lightBodyMediumTextColor = Colors.black54;

// Colors for dark theme
const Color darkAppBarColor = Color(0xff212124);
const Color darkBodyColor = Color(0xff303031);
const Color darkCardColor = Color(0xff242424);
const Color darkSettingsHeaderColor = Color(0xff15151a);
const Color darkSettingsOptionColor = Color(0xff1e1e21);
const Color darkBodyMediumTextColor = Colors.white;

// this map is for dark theme primary color
const Map<int, Color> _darkThemeColorsMap = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

const MaterialColor darkThemePrimaryColor =
    MaterialColor(0xFF880E4F, _darkThemeColorsMap);
