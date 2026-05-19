import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  static TextStyle get headingLarge =>
      GoogleFonts.mukta(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: -0.08 * 28,
      );

  static TextStyle get headingMedium =>
      GoogleFonts.mukta(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.08 * 22,
      );

  static TextStyle get bodyLarge =>
      GoogleFonts.mukta(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        letterSpacing: -0.08 * 16,
      );

  static TextStyle get bodyMedium =>
      GoogleFonts.mukta(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        letterSpacing: -0.08 * 14,
      );

  static TextStyle get bodySmall =>
      GoogleFonts.mukta(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        letterSpacing: -0.08 * 12,
      );

  static TextStyle get button =>
      GoogleFonts.mukta(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        letterSpacing: -0.08 * 14,
      );
}