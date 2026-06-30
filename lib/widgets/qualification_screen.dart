import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class QualificationRequiredWidget extends StatelessWidget {
  const QualificationRequiredWidget({super.key});

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
          SizedBox(height: size.height * 0.08),
          _buildTimeline(isMobile, size),
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
            "MY JOURNEY",
            style: GoogleFonts.inter(
              color: AppColors.primary,
              fontSize: 12,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.016),
        Text(
          "Education & Background",
          textAlign: TextAlign.center,
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

  Widget _buildTimeline(bool isMobile, Size size) {
    return Column(
      children: [
        _timelineItem(
          "2023 - Present",
          "BS Software Engineering",
          "The Islamia University of Bahawalpur",
          "Specializing in software architecture and mobile development. Maintaining a 3.86 CGPA with focus on scalable applications.",
          FontAwesomeIcons.graduationCap,
          AppColors.primary,
          false,
          isMobile,
          size,
        ),
        _timelineItem(
          "2020 - 2022",
          "Fsc Pre-Engineering",
          "Superior Group of Colleges",
          "Completed higher secondary education with major focus on Mathematics and Physics, securing 936/1100 marks.",
          FontAwesomeIcons.userGraduate,
          AppColors.accent,
          false,
          isMobile,
          size,
        ),
        _timelineItem(
          "2018 - 2020",
          "Matriculation",
          "Dawn Science School",
          "Completed secondary education with high honors, securing 1011/1100 marks in Science group.",
          FontAwesomeIcons.school,
          AppColors.secondary,
          true,
          isMobile,
          size,
        ),
      ],
    );
  }

  Widget _timelineItem(
    String period, 
    String title, 
    String subtitle, 
    String desc, 
    IconData icon, 
    Color color,
    bool isLast,
    bool isMobile,
    Size size,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile)
          SizedBox(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                period,
                textAlign: TextAlign.right,
                style: GoogleFonts.inter(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        if (!isMobile) const SizedBox(width: 30),
        Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: isMobile ? 180 : 150, // Fixed height for the line to avoid IntrinsicHeight issues
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [color, color.withValues(alpha: 0.1)],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.03),
            child: _EducationCard(
              period: period,
              title: title,
              subtitle: subtitle,
              desc: desc,
              color: color,
              isMobile: isMobile,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1);
  }
}

class _EducationCard extends StatelessWidget {
  final String period;
  final String title;
  final String subtitle;
  final String desc;
  final Color color;
  final bool isMobile;

  const _EducationCard({
    required this.period,
    required this.title,
    required this.subtitle,
    required this.desc,
    required this.color,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuart,
        padding: EdgeInsets.all(isMobile ? 20 : 32),
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
              blurRadius: isHovered ? 40 : 20,
              offset: Offset(0, isHovered ? 20 : 10),
            )
          ],
        ),
        transform: !isMobile && isHovered 
          ? (Matrix4.identity()
            ..translate(10.0, -10.0)
            ..rotateZ(0.02))
          : Matrix4.identity(),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Added to prevent vertical overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isMobile)
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.008),
                child: Text(
                  period,
                  style: GoogleFonts.inter(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.008),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                color: color,
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height * 0.016),
            Text(
              desc,
              softWrap: true, // Ensures text wraps correctly
              style: AppStyles.body.copyWith(
                fontSize: isMobile ? 13 : 14,
                color: Colors.white.withValues(alpha: 0.5),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
