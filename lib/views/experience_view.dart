import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/experience_model.dart';
import 'package:practice_web/view_models/experience_view_model.dart';

class ExperienceView extends StatelessWidget {
  final bool animate;
  final ExperienceViewModel viewModel = ExperienceViewModel();
  
  ExperienceView({super.key, this.animate = false});

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
          SectionAnimation(
            animate: animate,
            child: _buildHeader(size),
          ),
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
            viewModel.headerTag,
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
          viewModel.headerTitle,
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
    );
  }

  Widget _buildExperienceSection(bool isMobile, Size size) {
    return Column(
      children: [
        Wrap(
          spacing: 25,
          runSpacing: 25,
          alignment: WrapAlignment.center,
          children: List.generate(viewModel.experiences.length, (index) {
            return _experienceCard(
              viewModel.experiences[index],
              isMobile,
              size,
              index,
            );
          }),
        ),
      ],
    );
  }

  Widget _experienceCard(
    ExperienceModel data,
    bool isMobile,
    Size size,
    int index,
  ) {
    return CustomHoverCard(
      highlightColor: data.color,
      animate: animate,
      delay: (200 + index * 100).ms,
      width: isMobile ? double.infinity : 320,
      padding: const EdgeInsets.all(28),
      builder: (isHovered) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isHovered ? data.color : data.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isHovered ? [
                    BoxShadow(
                      color: data.color.withValues(alpha: 0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ] : [],
                ),
                child: Icon(
                  data.icon, 
                  color: isHovered ? Colors.white : data.color, 
                  size: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  data.period,
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
            data.company,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            data.location,
            style: GoogleFonts.inter(
              color: data.color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            data.role,
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
            color: data.color,
          ),
        ],
      ),
    );
  }
}
