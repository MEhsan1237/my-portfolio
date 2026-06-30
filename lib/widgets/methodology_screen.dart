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
          isMobile 
            ? Column(
                children: [
                  _buildSkillsList("Development", [
                    _AnimatedSkillItem(title: "Flutter & Dart", level: 0.95, icon: FontAwesomeIcons.flutter, color: Colors.blue),
                    _AnimatedSkillItem(title: "React.js & Next.js", level: 0.85, icon: FontAwesomeIcons.react, color: Colors.cyan),
                    _AnimatedSkillItem(title: "Node.js & Express", level: 0.80, icon: FontAwesomeIcons.nodeJs, color: Colors.green),
                    _AnimatedSkillItem(title: "Clean Architecture", level: 0.90, icon: FontAwesomeIcons.code, color: Colors.indigoAccent),
                  ], size),
                  SizedBox(height: size.height * 0.04),
                  _buildSkillsList("Tools & DB", [
                    _AnimatedSkillItem(title: "Firebase & Supabase", level: 0.90, icon: FontAwesomeIcons.fire, color: Colors.orange),
                    _AnimatedSkillItem(title: "MongoDB & SQL", level: 0.85, icon: FontAwesomeIcons.database, color: Colors.greenAccent),
                    _AnimatedSkillItem(title: "Git & CI/CD", level: 0.95, icon: FontAwesomeIcons.github, color: Colors.white),
                    _AnimatedSkillItem(title: "UI/UX (Figma)", level: 0.75, icon: FontAwesomeIcons.figma, color: Colors.pinkAccent),
                  ], size),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSkillsList("Core Development", [
                      _AnimatedSkillItem(title: "Flutter & Dart", level: 0.95, icon: FontAwesomeIcons.flutter, color: Colors.blue),
                      _AnimatedSkillItem(title: "React.js & Next.js", level: 0.85, icon: FontAwesomeIcons.react, color: Colors.cyan),
                      _AnimatedSkillItem(title: "Node.js & Express", level: 0.80, icon: FontAwesomeIcons.nodeJs, color: Colors.green),
                      _AnimatedSkillItem(title: "Clean Architecture", level: 0.90, icon: FontAwesomeIcons.code, color: Colors.indigoAccent),
                    ], size),
                  ),
                  SizedBox(width: size.width * 0.06),
                  Expanded(
                    child: _buildSkillsList("Tools & Infrastructure", [
                      _AnimatedSkillItem(title: "Firebase & Supabase", level: 0.90, icon: FontAwesomeIcons.fire, color: Colors.orange),
                      _AnimatedSkillItem(title: "MongoDB & SQL", level: 0.85, icon: FontAwesomeIcons.database, color: Colors.greenAccent),
                      _AnimatedSkillItem(title: "Git & CI/CD", level: 0.95, icon: FontAwesomeIcons.github, color: Colors.white),
                      _AnimatedSkillItem(title: "UI/UX (Figma)", level: 0.75, icon: FontAwesomeIcons.figma, color: Colors.pinkAccent),
                    ], size),
                  ),
                ],
              ),
          SizedBox(height: size.height * 0.08),
          _buildTechIcons(),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
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
        SizedBox(height: size.height * 0.01),
        Text(
          "Technologies I Master",
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
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildSkillsList(String category, List<Widget> skills, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            category,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        ...skills,
      ],
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
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
  final String title;
  final double level;
  final IconData icon;
  final Color color;

  const _AnimatedSkillItem({
    required this.title, 
    required this.level,
    required this.icon,
    required this.color,
  });

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
          color: isHovered ? color.withValues(alpha: 0.05) : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.4) : Colors.white.withValues(alpha: 0.03),
            width: 1.5,
          ),
          boxShadow: isHovered ? [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
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
                    color: isHovered ? color.withValues(alpha: 0.1) : Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: isHovered ? color : Colors.white54, size: 20),
                ),
                SizedBox(width: size.width * 0.016),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      color: isHovered ? Colors.white : Colors.white70, 
                      fontWeight: isHovered ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                Animate(
                  effects: [
                    CustomEffect(
                      duration: 1500.ms,
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) => Text(
                        "${(value * level * 100).toInt()}%",
                        style: GoogleFonts.inter(
                          color: isHovered ? Colors.white : color, 
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
                  effects: [
                    CustomEffect(
                      duration: 1500.ms,
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) => FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: value * level,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color, color.withValues(alpha: 0.6)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: color.withValues(alpha: isHovered ? 0.5 : 0.2),
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
