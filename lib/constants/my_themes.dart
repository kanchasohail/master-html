import 'consts.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    primarySwatch: darkThemePrimaryColor,
    scaffoldBackgroundColor: darkBodyColor,
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent
    ),
    iconTheme: const IconThemeData(color: orangeColor),
    drawerTheme: const DrawerThemeData(
      backgroundColor: lightBlack
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: darkBodyMediumTextColor),
        labelMedium:
            TextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.4),
      headlineLarge: TextStyle(fontSize: 24 , fontWeight: FontWeight.w600 , color: Colors.white),
      bodySmall: TextStyle(fontSize: 16 , color: Colors.white , fontWeight: FontWeight.w400),),

    appBarTheme: const AppBarTheme(
      backgroundColor: darkAppBarColor,
      iconTheme: IconThemeData(color: orangeColor , size: 30),
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
    textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.transparent
    ),
    iconTheme: const IconThemeData(color: orangeColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightAppBarColor,
      iconTheme: IconThemeData(color: orangeColor , size: 30),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: lightBodyColor
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.black),
        labelMedium:
            TextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.4),
      headlineLarge: TextStyle(fontSize: 24 , fontWeight: FontWeight.w600 , color: Colors.black),
      bodySmall: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.w400),
    ),
    cardTheme: CardTheme(
        color: lightCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
    colorScheme: const ColorScheme.light(),
  );
}
