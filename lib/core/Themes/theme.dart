import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/Themes/colors.dart';

final theme = ThemeData(
  primaryColor: ThemeColors.black,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  }),
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
      fixedSize: Size(double.infinity, 55.h),
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
      minimumSize: Size(double.infinity, 55.h),
    ),
  ),
  scaffoldBackgroundColor: ThemeColors.black,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.inter(
      fontSize: 36.sp,
      fontWeight: FontWeight.w500,
      color: ThemeColors.white,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16.sp,
      color: ThemeColors.white,
    ),
  ),
);
