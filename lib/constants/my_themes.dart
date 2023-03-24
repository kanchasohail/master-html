// This class is for customising colors of the theme

import 'consts.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    primarySwatch: darkThemePrimaryColor,
    scaffoldBackgroundColor: darkBodyColor,
    iconTheme: const IconThemeData(color: orangeColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkAppBarColor,
      iconTheme: IconThemeData(
        color: orangeColor
      ),
    ),
    cardTheme: CardTheme(
      color: darkCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    colorScheme: const ColorScheme.dark(),
  );

  //light theme

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBodyColor,
    iconTheme: const IconThemeData(color: orangeColor),
    appBarTheme: const AppBarTheme(backgroundColor: lightAppBarColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    cardTheme: CardTheme(
        color: lightCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
    colorScheme: const ColorScheme.light(),
  );
}
