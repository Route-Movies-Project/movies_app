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
