import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      iconTheme: const IconThemeData(color: AppColors.white),
      dividerColor: AppColors.tertiary,
      dividerTheme: const DividerThemeData(color: AppColors.tertiary),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.nunito(
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          letterSpacing: -0.5,
          fontSize: 102,
        ),
        displayMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          letterSpacing: -0.25,
          fontSize: 64,
        ),
        displaySmall: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          fontSize: 51,
        ),
        headlineMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          letterSpacing: 0.15,
          fontSize: 36,
        ),
        headlineSmall: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          fontSize: 25,
        ),
        titleLarge: GoogleFonts.nunito(
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          letterSpacing: 0.1,
          fontSize: 20,
        ),
        titleMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          letterSpacing: 0.1,
          fontSize: 18,
        ),
        titleSmall: GoogleFonts.nunito(
          fontWeight: FontWeight.w500,
          color: AppColors.white,
          letterSpacing: 0.05,
          fontSize: 16,
        ),
        bodyLarge: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          letterSpacing: 0.15,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          letterSpacing: 0.1,
          fontSize: 14,
        ),
        bodySmall: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
        labelLarge: GoogleFonts.nunito(
          fontWeight: FontWeight.w500,
          color: AppColors.white,
          letterSpacing: 0.5,
          fontSize: 14,
        ),
        labelSmall: GoogleFonts.nunito(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          letterSpacing: 0.5,
          fontSize: 10,
        ),
      ),
    );
  }

  static ThemeData get theme => lightTheme;
}
