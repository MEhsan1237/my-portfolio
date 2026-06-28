import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -1,
  );

  static TextStyle subHeading = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static TextStyle navItem = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}

class AppDimensions {
  static const double padding = 20.0;
  static const double borderRadius = 16.0;
  static const double maxContentWidth = 1200.0;
}

class HoverItem extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HoverItem({super.key, required this.builder});

  @override
  State<HoverItem> createState() => _HoverItemState();
}

class _HoverItemState extends State<HoverItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: widget.builder(_isHovered),
    );
  }
}
