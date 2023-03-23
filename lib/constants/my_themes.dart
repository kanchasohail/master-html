// This class is for customising colors of the theme

import 'consts.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    primarySwatch: darkThemePrimaryColor,
    scaffoldBackgroundColor: darkBlue,
    iconTheme: const IconThemeData(color: greenColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkThemePrimaryColor,
    ),
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: orangeColor),
    appBarTheme: const AppBarTheme(backgroundColor: lightViolet),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    colorScheme: const ColorScheme.light(),
  );
}
