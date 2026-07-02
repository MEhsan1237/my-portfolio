import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppColors {
  static const Color primary = Color(0xFF6366F1); // Modern Indigo
  static const Color secondary = Color(0xFFA855F7); // Purple
  static const Color accent = Color(0xFF22D3EE); // Cyan
  static const Color background = Color(0xFF0F172A); // Slate 900
  static const Color surface = Color(0xFF1E293B); // Slate 800
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class AppStyles {
  static final TextStyle heading = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -1,
  );

  static final TextStyle subHeading = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static final TextStyle navItem = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static final TextStyle logo = GoogleFonts.breeSerif(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    letterSpacing: 1,
  );

  static final TextStyle heroName = GoogleFonts.breeSerif(
    fontWeight: FontWeight.bold,
    height: 1.1,
  );

  static final TextStyle sectionTag = GoogleFonts.inter(
    color: AppColors.primary,
    fontSize: 12,
    letterSpacing: 2,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle contactLabel = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle footerTitle = GoogleFonts.inter(
    color: AppColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  static final TextStyle projectTitle = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle tagStyle = GoogleFonts.inter(
    color: AppColors.primary,
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle detailLabel = GoogleFonts.inter(
    color: AppColors.textSecondary,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );

  static final TextStyle detailValue = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}

class AppDimensions {
  static const double padding = 20.0;
  static const double borderRadius = 16.0;
  static const double maxContentWidth = 1200.0;
}

