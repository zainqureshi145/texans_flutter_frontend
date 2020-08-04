import 'package:flutter/material.dart';

//const kButtonColor = Color(0xFFEE645D);
const kButtonColor = Color(0xFF51C8F5);

class Constants {
  static String appName = "Texans Burger";

  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Color(0xFF111328);
  //static Color lightAccent = Colors.grey[400];
  static Color lightAccent = Color(0xFF111328);
  static Color darkAccent = Color(0XFF2E4053);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xFF111328);
  static Color ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

//  static ThemeData darkTheme = ThemeData(
//    brightness: Brightness.dark,
//    backgroundColor: darkBG,
//    primaryColor: darkPrimary,
//    accentColor: darkAccent,
//    scaffoldBackgroundColor: darkBG,
//    cursorColor: darkAccent,
//    appBarTheme: AppBarTheme(
//      textTheme: TextTheme(
//        title: TextStyle(
//          color: lightBG,
//          fontSize: 18.0,
//          fontWeight: FontWeight.w800,
//        ),
//      ),
//    ),
//  );
}
