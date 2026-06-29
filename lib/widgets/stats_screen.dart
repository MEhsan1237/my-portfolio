import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return isMobile
        ? Column(
            children: [
              _buildPremiumStatCard("20+", "Projects Completed", FontAwesomeIcons.diagramProject, AppColors.primary, 0, true),
              const SizedBox(height: 24),
              _buildPremiumStatCard("3+", "Years of Experience", FontAwesomeIcons.laptopCode, AppColors.accent, 1, true),
              const SizedBox(height: 24),
              _buildPremiumStatCard("10+", "Technologies Used", FontAwesomeIcons.stackOverflow, AppColors.secondary, 2, true),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildPremiumStatCard("20+", "Projects Completed", FontAwesomeIcons.diagramProject, AppColors.primary, 0, false)),
              const SizedBox(width: 20),
              Expanded(child: _buildPremiumStatCard("3+", "Years of Experience", FontAwesomeIcons.laptopCode, AppColors.accent, 1, false)),
              const SizedBox(width: 20),
              Expanded(child: _buildPremiumStatCard("10+", "Technologies Used", FontAwesomeIcons.stackOverflow, AppColors.secondary, 2, false)),
            ],
          );
  }

  Widget _buildPremiumStatCard(String value, String label, IconData icon, Color color, int index, bool isMobile) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: EdgeInsets.symmetric(vertical: isMobile ? 24 : 32, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? color.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 30 : 15,
              offset: Offset(0, isHovered ? 15 : 5),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.1, 1.1)),
            const SizedBox(height: 16),
            Text(
              value,
              style: GoogleFonts.poppins(
                color: color,
                fontSize: isMobile ? 32 : 36,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
                height: 1,
              ),
            ).animate().fadeIn(delay: (200 + index * 100).ms).slideY(begin: 0.2, end: 0),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0)
       .moveY(end: -10, duration: 400.ms, curve: Curves.easeOutCubic),
    );
  }
}
