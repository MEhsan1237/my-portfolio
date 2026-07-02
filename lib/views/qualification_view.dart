import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/education_model.dart';
import 'package:practice_web/view_models/education_view_model.dart';

class QualificationView extends StatelessWidget {
  final bool animate;
  final EducationViewModel viewModel = EducationViewModel();
  
  QualificationView({super.key, this.animate = false});

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
            viewModel.headerTag,
            style: AppStyles.sectionTag.copyWith(fontSize: 12, letterSpacing: 4),
          ),
        ),
        SizedBox(height: size.height * 0.016),
        Text(
          viewModel.headerTitle,
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
    );
  }

  Widget _buildTimeline(bool isMobile, Size size) {
    return Column(
      children: List.generate(viewModel.education.length, (index) {
        return _timelineItem(
          viewModel.education[index],
          index == viewModel.education.length - 1,
          isMobile,
          size,
          index,
        );
      }),
    );
  }

  Widget _timelineItem(
    EducationModel data,
    bool isLast,
    bool isMobile,
    Size size,
    int index,
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
                data.period,
                textAlign: TextAlign.right,
                style: GoogleFonts.inter(
                  color: data.color,
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
                color: data.color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: data.color, width: 2),
              ),
              child: Icon(data.icon, color: data.color, size: 18),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: isMobile ? 180 : 150,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [data.color, data.color.withValues(alpha: 0.1)],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.03),
            child: CustomHoverCard(
              animate: animate,
              delay: (index * 150).ms,
              highlightColor: data.color,
              padding: EdgeInsets.all(isMobile ? 20 : 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isMobile)
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.008),
                      child: Text(
                        data.period,
                        style: GoogleFonts.inter(
                          color: data.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  Text(
                    data.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.008),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.inter(
                      color: data.color,
                      fontSize: isMobile ? 13 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: size.height * 0.016),
                  Text(
                    data.description,
                    softWrap: true,
                    style: AppStyles.body.copyWith(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.white.withValues(alpha: 0.5),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

