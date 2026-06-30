import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.06,
        bottom: 50,
        left: isMobile ? 20 : size.width * 0.1,
        right: isMobile ? 20 : size.width * 0.1,
      ),
      child: Column(
        children: [
          _buildHeader(size),
          SizedBox(height: size.height * 0.06),
          _buildExperienceSection(isMobile, size),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "JOURNEY",
            style: GoogleFonts.inter(
              color: AppColors.primary,
              fontSize: 12,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
        Text(
          "Professional Path",
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildExperienceSection(bool isMobile, Size size) {
    return Column(
      children: [
        Wrap(
          spacing: 25,
          runSpacing: 25,
          alignment: WrapAlignment.center,
          children: [
            _experienceCard(
              "DevelopersHub Corp",
              "India (Remote)",
              "Flutter Developer Intern",
              "May 2024 - June 2024",
              FontAwesomeIcons.laptopCode,
              Colors.tealAccent,
              isMobile,
              size,
            ),
            _experienceCard(
              "Future Dev Solution",
              "Lahore (Onsite)",
              "Junior Web Developer",
              "2025 - 2026",
              FontAwesomeIcons.code,
              AppColors.accent,
              isMobile,
              size,
            ),
            _experienceCard(
              "Excelerate Talent Dis",
              "Dubai (Remote)",
              "Flutter Development Intern",
              "June 2025 - July 2025",
              FontAwesomeIcons.mobileScreen,
              AppColors.primary,
              isMobile,
              size,
            ),
            _experienceCard(
              "Apexify Technologies",
              "India (Remote)",
              "Flutter Developer Intern",
              "March 2026 - April 2026",
              FontAwesomeIcons.flutter,
              Colors.orangeAccent,
              isMobile,
              size,
            ),
            _experienceCard(
              "CodeAlpha",
              "Bahawalpur (Remote)",
              "Full Stack Web Intern",
              "May 2026 - June 2026",
              FontAwesomeIcons.layerGroup,
              AppColors.secondary,
              isMobile,
              size,
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
  }

  Widget _experienceCard(
    String company,
    String location,
    String role,
    String period,
    IconData icon,
    Color color,
    bool isMobile,
    Size size,
  ) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isMobile ? double.infinity : 320,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: isHovered ? color.withValues(alpha: 0.05) : AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? color.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 40 : 20,
              offset: Offset(0, isHovered ? 20 : 10),
            )
          ],
        ),
        transform: isHovered ? Matrix4.translationValues(0, -12, 0) : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    period,
                    style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            Text(
              company,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              location,
              style: GoogleFonts.inter(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              role,
              style: AppStyles.body.copyWith(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.025),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: isHovered ? 50 : 0,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
