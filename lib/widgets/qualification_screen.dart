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
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 20 : size.width * 0.1,
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 80),
          _buildTimeline(isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "MY JOURNEY",
          style: GoogleFonts.inter(
            color: AppColors.primary,
            fontSize: 14,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Experience & Education",
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 20),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildTimeline(bool isMobile) {
    return Column(
      children: [
        _timelineItem(
          "2023 - Present",
          "BS Software Engineering",
          "The Islamia University of Bahawalpur",
          "Currently pursuing my degree with a focus on advanced software architecture and mobile development. Maintaining a 3.86 CGPA.",
          FontAwesomeIcons.graduationCap,
          true,
        ),
        _timelineItem(
          "2022 - 2023",
          "Freelance Flutter Developer",
          "Self-Employed",
          "Developed several cross-platform mobile applications for local and international clients, focusing on clean UI and robust performance.",
          FontAwesomeIcons.laptopCode,
          false,
        ),
        _timelineItem(
          "2020 - 2022",
          "Fsc Pre-Engineering",
          "Superior Group of Colleges",
          "Completed higher secondary education with major focus on Mathematics and Physics, securing 936/1100 marks.",
          FontAwesomeIcons.userGraduate,
          false,
        ),
      ],
    );
  }

  Widget _timelineItem(String period, String title, String subtitle, String desc, IconData icon, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              period,
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Icon(icon, color: AppColors.primary, size: 16),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: AppColors.accent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  desc,
                  style: AppStyles.body.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1);
  }
}
