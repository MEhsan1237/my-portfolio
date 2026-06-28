import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : size.width * 0.1,
      ),
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          _buildStatCard("20+", "Projects Completed", FontAwesomeIcons.checkDouble, AppColors.primary),
          _buildStatCard("3+", "Years of Experience", FontAwesomeIcons.laptopCode, AppColors.accent),
          _buildStatCard("15+", "Global Clients", FontAwesomeIcons.users, AppColors.secondary),
          _buildStatCard("10+", "Technologies Mastered", FontAwesomeIcons.layerGroup, Colors.orangeAccent),
        ],
      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return HoverItem(
      builder: (isHovered) => Container(
        width: 260,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.05, 1.05)),
    );
  }
}
