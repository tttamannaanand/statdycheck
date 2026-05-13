import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle get displayLarge => GoogleFonts.mukta(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.8,
      );

  static TextStyle get displayMedium => GoogleFonts.mukta(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.8,
      );

  static TextStyle get headingLarge => GoogleFonts.mukta(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.8,
      );

  static TextStyle get headingMedium => GoogleFonts.mukta(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.8,
      );

  static TextStyle get bodyLarge => GoogleFonts.mukta(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: -0.8,
      );

  static TextStyle get bodyMedium => GoogleFonts.mukta(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: -0.8,
      );

  static TextStyle get bodySmall => GoogleFonts.mukta(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: -0.8,
      );
}
