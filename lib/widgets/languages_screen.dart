import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    final skills = [
      {"title": "Dart", "icon": FontAwesomeIcons.dartLang, "color": AppColors.primary, "level": 0.95},
      {"title": "Node.js", "icon": FontAwesomeIcons.nodeJs, "color": Colors.green, "level": 0.85},
      {"title": "MongoDB", "icon": FontAwesomeIcons.database, "color": Colors.greenAccent, "level": 0.80},
      {"title": "JavaScript", "icon": FontAwesomeIcons.js, "color": Colors.yellow, "level": 0.90},
      {"title": "HTML5", "icon": FontAwesomeIcons.html5, "color": Colors.orange, "level": 0.98},
      {"title": "CSS3", "icon": FontAwesomeIcons.css3Alt, "color": Colors.blueAccent, "level": 0.95},
      {"title": "Tailwind", "icon": FontAwesomeIcons.wind, "color": Colors.cyanAccent, "level": 0.90},
      {"title": "Git", "icon": FontAwesomeIcons.github, "color": Colors.white, "level": 0.95},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : size.width * 0.1,
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 60),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: List.generate(skills.length, (index) {
              return _skillCard(
                skills[index]["title"] as String,
                skills[index]["icon"] as IconData,
                skills[index]["color"] as Color,
                skills[index]["level"] as double,
                index,
              );
            }),
          ).animate().fadeIn(delay: 200.ms).scale(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "TECHNICAL STACK",
          style: GoogleFonts.inter(
            color: AppColors.primary,
            fontSize: 14,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Languages & Tools",
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _skillCard(String title, IconData icon, Color color, double level, int index) {
    return HoverItem(
      builder: (isHovered) => Container(
        width: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.5) : color.withValues(alpha: 0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: isHovered ? 0.2 : 0.05),
              blurRadius: isHovered ? 20 : 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: isHovered ? Colors.white : color, size: 40)
                .animate(target: isHovered ? 1 : 0)
                .scale(end: const Offset(1.2, 1.2)),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: level,
                backgroundColor: Colors.white.withValues(alpha: 0.05),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 4,
              ),
            ),
          ],
        ),
      )
      .animate(target: isHovered ? 1 : 0)
      .moveY(end: -10, duration: 300.ms, curve: Curves.easeOut)
      .animate(onPlay: (c) => c.repeat(reverse: true))
      .moveY(
        begin: -4, 
        end: 4, 
        duration: (2.0 + (index * 0.3)).seconds, 
        curve: Curves.easeInOut,
      ),
    );
  }
}
