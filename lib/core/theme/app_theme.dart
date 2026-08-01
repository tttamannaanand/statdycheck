import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: GoogleFonts.mukta().fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accentRed,
          secondary: AppColors.primaryRed,
          surface: AppColors.surface,
          error: AppColors.accentRed,
        ),
        dividerColor: AppColors.divider,
      );
}
