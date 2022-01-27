import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color loginBtnCLr = Colors.purple;
  static Color signUpBtnClr = Colors.grey.shade300;
  static Color loginPageBoxClr = const Color(0xFFccccFF);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme(
          primary: Colors.white,
          primaryVariant: Colors.black87,
          secondary: Colors.black54,
          secondaryVariant: Colors.black54,
          surface: Colors.cyan,
          background: Colors.cyan.shade100,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.black,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme(
          primary: Colors.black,
          primaryVariant: Colors.white,
          secondary: Colors.white,
          secondaryVariant: Colors.white,
          surface: Colors.cyan,
          background: Colors.cyan.shade100,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.red,
          brightness: Brightness.dark,
        ),
      );
}
