import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/skill_model.dart';
import 'package:practice_web/view_models/skills_view_model.dart';

class LanguagesView extends StatelessWidget {
  final bool animate;
  final SkillsViewModel viewModel = SkillsViewModel();
  
  LanguagesView({super.key, this.animate = false});

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
          Wrap(
            spacing: 55,
            runSpacing: 55,
            alignment: WrapAlignment.center,
            children: List.generate(viewModel.technicalStack.length, (index) {
              return _skillCard(
                viewModel.technicalStack[index],
                index,
                size,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Text(
          "TECHNICAL STACK",
          style: AppStyles.sectionTag.copyWith(fontSize: 14, letterSpacing: 4),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          "Languages & Tools",
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  Widget _skillCard(SkillModel data, int index, Size size) {
    return CustomHoverCard(
      highlightColor: data.color,
      animate: animate,
      delay: (200 + index * 100).ms,
      width: 200,
      padding: const EdgeInsets.all(24),
      builder: (isHovered) => Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isHovered ? data.color.withValues(alpha: 0.15) : data.color.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              boxShadow: isHovered ? [
                BoxShadow(color: data.color.withValues(alpha: 0.2), blurRadius: 15)
              ] : [],
            ),
            child: Icon(data.icon, color: isHovered ? Colors.white : data.color, size: 32),
          ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.1, 1.1)),
          SizedBox(height: size.height * 0.02),
          Text(
            data.title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: isHovered ? FontWeight.w700 : FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(height: size.height * 0.016),
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Animate(
                effects: [
                  CustomEffect(
                    duration: 1500.ms,
                    curve: Curves.easeOutQuart,
                    builder: (context, value, child) => FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: value * data.level,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [data.color, data.color.withValues(alpha: 0.7)],
                          ),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: data.color.withValues(alpha: isHovered ? 0.6 : 0.3),
                              blurRadius: isHovered ? 10 : 4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
