import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/Themes/colors.dart';

final theme = ThemeData(
  primaryColor: ThemeColors.black,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: GoogleFonts.roboto(
      color: ThemeColors.yellow,
      fontSize: 16,
    ),
    iconTheme: const IconThemeData(
      color: ThemeColors.yellow,
    ),
    backgroundColor: ThemeColors.black,
    surfaceTintColor: ThemeColors.black,
    foregroundColor: ThemeColors.yellow,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ThemeColors.yellow,
      textStyle: GoogleFonts.roboto(
        color: ThemeColors.black,
        fontSize: 20,
      ),
      foregroundColor: ThemeColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
    ),
  ),
  scaffoldBackgroundColor: ThemeColors.black,
  inputDecorationTheme: InputDecorationTheme(
    
    hintStyle: TextStyle(fontSize: 16 ,
    fontWeight: FontWeight.w400,
    color: ThemeColors.white,
    ),
     enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1 ,color:  ThemeColors.grey),
      borderRadius: BorderRadius.circular(15), 
    ),
      focusedErrorBorder:
    OutlineInputBorder(
      borderSide: BorderSide(width: 1 ,color:  ThemeColors.grey),
    ),
   suffixIconColor: ThemeColors.white,
    
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: ThemeColors.white,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16,
      color: ThemeColors.white,
    ),
  ),
);
