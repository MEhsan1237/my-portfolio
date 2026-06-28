import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class MethodologyScreen extends StatelessWidget {
  const MethodologyScreen({super.key});

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
          const SizedBox(height: 60),
          isMobile 
            ? Column(
                children: [
                  _buildSkillsList("Development", [
                    _skillItem("Flutter", 0.95),
                    _skillItem("React.js", 0.85),
                    _skillItem("Node.js", 0.80),
                    _skillItem("Dart", 0.90),
                  ]),
                  const SizedBox(height: 40),
                  _buildSkillsList("Tools & DB", [
                    _skillItem("Firebase", 0.90),
                    _skillItem("MongoDB", 0.85),
                    _skillItem("Git", 0.95),
                    _skillItem("Figma", 0.75),
                  ]),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSkillsList("Core Development", [
                      _skillItem("Flutter & Dart", 0.95),
                      _skillItem("React.js & Next.js", 0.85),
                      _skillItem("Node.js & Express", 0.80),
                      _skillItem("Clean Architecture", 0.90),
                    ]),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    child: _buildSkillsList("Tools & Infrastructure", [
                      _skillItem("Firebase & Supabase", 0.90),
                      _skillItem("MongoDB & SQL", 0.85),
                      _skillItem("Git & CI/CD", 0.95),
                      _skillItem("UI/UX (Figma)", 0.75),
                    ]),
                  ),
                ],
              ),
          const SizedBox(height: 80),
          _buildTechIcons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "SKILLS & EXPERTISE",
          style: GoogleFonts.inter(
            color: AppColors.primary,
            fontSize: 14,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Technologies I Master",
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

  Widget _buildSkillsList(String category, List<Widget> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        ...skills,
      ],
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
  }

  Widget _skillItem(String title, double level) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              Text(
                "${(level * 100).toInt()}%",
                style: GoogleFonts.inter(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: 8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: level,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                ),
              ).animate().shimmer(duration: 2.seconds, color: Colors.white24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechIcons() {
    return Wrap(
      spacing: 25,
      runSpacing: 25,
      alignment: WrapAlignment.center,
      children: [
        _techIcon(FontAwesomeIcons.flutter, AppColors.primary, 0),
        _techIcon(FontAwesomeIcons.react, AppColors.accent, 1),
        _techIcon(FontAwesomeIcons.nodeJs, Colors.green, 2),
        _techIcon(FontAwesomeIcons.fire, Colors.orange, 3),
        _techIcon(FontAwesomeIcons.database, Colors.greenAccent, 4),
        _techIcon(FontAwesomeIcons.github, Colors.white, 5),
      ],
    ).animate().fadeIn(delay: 600.ms).scale();
  }

  Widget _techIcon(IconData icon, Color color, int index) {
    return HoverItem(
      builder: (isHovered) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: isHovered ? color : color.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: isHovered ? 0.3 : 0.1),
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
