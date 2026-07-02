import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/skill_model.dart';
import 'package:practice_web/view_models/skills_view_model.dart';

class MethodologyView extends StatelessWidget {
  final bool animateCore;
  final Key? toolsKey;
  final bool animateTools;
  final SkillsViewModel viewModel = SkillsViewModel();
  
  MethodologyView({
    super.key, 
    this.animateCore = false,
    this.toolsKey,
    this.animateTools = false,
  });

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
            animate: animateCore,
            child: _buildHeader(size),
          ),
          SizedBox(height: size.height * 0.06),
          isMobile 
            ? Column(
                children: [
                  _buildSkillsList("Development", viewModel.devSkills.map((s) => _AnimatedSkillItem(data: s, animate: animateCore)).toList(), size, animateCore, 200),
                  SizedBox(height: size.height * 0.04),
                  Container(
                    key: toolsKey,
                    child: _buildSkillsList("Tools & DB", viewModel.toolSkills.map((s) => _AnimatedSkillItem(data: s, animate: animateTools)).toList(), size, animateTools, 200),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSkillsList("Core Development", viewModel.devSkills.map((s) => _AnimatedSkillItem(data: s, animate: animateCore)).toList(), size, animateCore, 200),
                  ),
                  SizedBox(width: size.width * 0.06),
                  Expanded(
                    child: Container(
                      key: toolsKey,
                      child: _buildSkillsList("Tools & Infrastructure", viewModel.toolSkills.map((s) => _AnimatedSkillItem(data: s, animate: animateTools)).toList(), size, animateTools, 400),
                    ),
                  ),
                ],
              ),
          SizedBox(height: size.height * 0.08),
          SectionAnimation(
            animate: animateTools,
            delay: 600.ms,
            child: _buildTechIcons(viewModel.technicalStack, animateTools),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Text(
          viewModel.headerTag,
          style: AppStyles.sectionTag.copyWith(fontSize: 14, letterSpacing: 4),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          viewModel.headerTitle,
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsList(String category, List<Widget> skills, Size size, bool animate, int delayMs) {
    return SectionAnimation(
      animate: animate,
      delay: delayMs.ms,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              category,
              style: AppStyles.subHeading.copyWith(fontSize: 22),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ...skills,
        ],
      ),
    );
  }

  Widget _buildTechIcons(List<SkillModel> technicalStack, bool animate) {
    return Wrap(
      spacing: 25,
      runSpacing: 25,
      alignment: WrapAlignment.center,
      children: List.generate(6, (index) {
        final skill = technicalStack[index];
        return _techIcon(skill.icon, skill.color, index, animate);
      }),
    );
  }

  Widget _techIcon(IconData icon, Color color, int index, bool animate) {
    return HoverItem(
      builder: (isHovered) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.5) : color.withValues(alpha: 0.1),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: isHovered ? 0.2 : 0.05),
              blurRadius: isHovered ? 20 : 10,
            )
          ],
        ),
        child: Icon(icon, color: isHovered ? Colors.white : color, size: 28),
      )
      .animate(target: isHovered ? 1 : 0)
      .scale(end: const Offset(1.15, 1.15))
      .animate(onPlay: (c) => c.repeat(reverse: true))
      .moveY(
        begin: -5, 
        end: 5, 
        duration: (1.5 + (index * 0.2)).seconds, 
        curve: Curves.easeInOut,
      ),
    );
  }
}

class _AnimatedSkillItem extends StatelessWidget {
  final SkillModel data;
  final bool animate;

  const _AnimatedSkillItem({required this.data, required this.animate});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuint,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered ? data.color.withValues(alpha: 0.05) : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? data.color.withValues(alpha: 0.4) : Colors.white.withValues(alpha: 0.03),
            width: 1.5,
          ),
          boxShadow: isHovered ? [
            BoxShadow(
              color: data.color.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ] : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isHovered ? data.color.withValues(alpha: 0.1) : Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(data.icon, color: isHovered ? data.color : Colors.white54, size: 20),
                ),
                SizedBox(width: size.width * 0.016),
                Expanded(
                  child: Text(
                    data.title,
                    style: GoogleFonts.inter(
                      color: isHovered ? Colors.white : Colors.white70, 
                      fontWeight: isHovered ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                Animate(
                  target: animate ? 1 : 0,
                  effects: [
                    CustomEffect(
                      duration: 4000.ms,
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) => Text(
                        "${(value * data.level * 100).toInt()}%",
                        style: GoogleFonts.inter(
                          color: isHovered ? Colors.white : data.color, 
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.016),
            Stack(
              children: [
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Animate(
                  target: animate ? 1 : 0,
                  effects: [
                    CustomEffect(
                      duration: 4000.ms,
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) => FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: value * data.level,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [data.color, data.color.withValues(alpha: 0.6)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: data.color.withValues(alpha: isHovered ? 0.5 : 0.2),
                                blurRadius: isHovered ? 12 : 6,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animate(onPlay: (c) => c.repeat()).shimmer(delay: 2.seconds, duration: 2.seconds, color: Colors.white24),
              ],
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.02, 1.02), curve: Curves.easeOutCubic),
    );
  }
}
