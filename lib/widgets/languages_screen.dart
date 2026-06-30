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
      {"title": "Postman", "icon": FontAwesomeIcons.rocket, "color": Colors.orange, "level": 0.90},
      {"title": "JavaScript", "icon": FontAwesomeIcons.js, "color": Colors.yellow, "level": 0.90},
      {"title": "HTML5", "icon": FontAwesomeIcons.html5, "color": Colors.orange, "level": 0.98},
      {"title": "CSS3", "icon": FontAwesomeIcons.css3Alt, "color": Colors.blueAccent, "level": 0.95},
      {"title": "Tailwind", "icon": FontAwesomeIcons.wind, "color": Colors.cyanAccent, "level": 0.90},
      {"title": "Git", "icon": FontAwesomeIcons.github, "color": Colors.white, "level": 0.95},
    ];

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
          Wrap(
            spacing: 55,
            runSpacing: 55,
            alignment: WrapAlignment.center,
            children: List.generate(skills.length, (index) {
              return _skillCard(
                skills[index]["title"] as String,
                skills[index]["icon"] as IconData,
                skills[index]["color"] as Color,
                skills[index]["level"] as double,
                index,
                size,
              );
            }),
          ).animate().fadeIn(delay: 200.ms).scale(),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
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
        SizedBox(height: size.height * 0.01),
        Text(
          "Languages & Tools",
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _skillCard(String title, IconData icon, Color color, double level, int index, Size size) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuart,
        width: 200,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isHovered ? color.withValues(alpha: 0.04) : AppColors.surface,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.4) : color.withValues(alpha: 0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: isHovered ? 0.1 : 0.05),
              blurRadius: isHovered ? 30 : 10,
              offset: Offset(0, isHovered ? 15 : 5),
            )
          ],
        ),
        transform: isHovered 
          ? (Matrix4.identity()
            ..translate(10.0, -10.0) // Education card style lift
            ..rotateZ(0.02)) // Education card style rotation
          : Matrix4.identity(),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isHovered ? color.withValues(alpha: 0.15) : color.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                boxShadow: isHovered ? [
                  BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 15)
                ] : [],
              ),
              child: Icon(icon, color: isHovered ? Colors.white : color, size: 32),
            ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.1, 1.1)),
            SizedBox(height: size.height * 0.02),
            Text(
              title,
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
                        widthFactor: value * level,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 6,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color, color.withValues(alpha: 0.7)],
                            ),
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: color.withValues(alpha: isHovered ? 0.6 : 0.3),
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
      )
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
