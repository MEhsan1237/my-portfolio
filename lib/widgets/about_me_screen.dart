import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/widgets/stats_screen.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

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
          SizedBox(height: size.height * 0.04),
          isMobile 
            ? Column(
                children: [
                  _buildAboutImage(size),
                  SizedBox(height: size.height * 0.03),
                  _buildAboutContent(size),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildAboutImage(size)),
                  SizedBox(width: size.width * 0.04),
                  Expanded(flex: 3, child: _buildAboutContent(size)),
                ],
              ),
          SizedBox(height: 50 + size.height * 0.06),
          const StatsSection(),
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
            "ABOUT ME",
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
          "Crafting Digital Excellence",
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

  Widget _buildAboutImage(Size size) {
    return HoverItem(
      builder: (isHovered) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // 1. Premium Layered Glow
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: 260,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: isHovered ? 0.4 : 0.0),
                  blurRadius: 60,
                  spreadRadius: isHovered ? 15 : 0,
                ),
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: isHovered ? 0.2 : 0.0),
                  blurRadius: 40,
                  offset: const Offset(-15, -15),
                )
              ],
            ),
          ),

          // 2. Main Image Card with Dynamic Tech Border
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: 280,
            height: 400,
            padding: const EdgeInsets.all(2), // Gradient border thickness
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: isHovered 
                  ? [AppColors.primary, AppColors.accent, AppColors.secondary]
                  : [Colors.white.withValues(alpha: 0.1), Colors.white.withValues(alpha: 0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(28),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Stack(
                  children: [
                    AnimatedScale(
                      scale: isHovered ? 1.12 : 1.0,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutQuart,
                      child: Image.asset(
                        "assets/images/mine.pic.png",
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    // Senior-level Overlay Gradient
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            isHovered 
                              ? AppColors.primary.withValues(alpha: 0.3) 
                              : Colors.black.withValues(alpha: 0.4),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ).animate(target: isHovered ? 1 : 0)
           .moveY(end: -12, duration: 600.ms, curve: Curves.easeOutBack),

          // 3. Floating Glassmorphic Stats
          Positioned(
            bottom: 30,
            left: -30,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "3+",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accent,
                        ),
                      ),
                      Text(
                        "Years Exp",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).animate(target: isHovered ? 1 : 0)
             .scale(end: const Offset(1.15, 1.15))
             .moveX(end: 15),
          ),

          // 4. Tech Accents (Corner Brackets)
          _techCorner(top: -15, left: -15, isHovered: isHovered, rotation: 0),
          _techCorner(bottom: -15, right: -15, isHovered: isHovered, rotation: 2),
        ],
      ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),
    );
  }

  Widget _techCorner({double? top, double? left, double? right, double? bottom, required bool isHovered, required int rotation}) {
    return Positioned(
      top: top, left: left, right: right, bottom: bottom,
      child: RotatedBox(
        quarterTurns: rotation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: isHovered ? 45 : 0,
          height: isHovered ? 45 : 0,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: isHovered ? AppColors.accent : Colors.transparent, width: 3),
              left: BorderSide(color: isHovered ? AppColors.accent : Colors.transparent, width: 3),
            ),
          ),
        ).animate(target: isHovered ? 1 : 0).fadeIn(),
      ),
    );
  }

  Widget _buildAboutContent(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Passionate Full-Stack Developer & UI/UX Designer",
          style: AppStyles.subHeading.copyWith(
            fontSize: 28, 
            color: Colors.white,
            height: 1.3,
          ),
        ),
        SizedBox(height: size.height * 0.025),
        Text(
          "I specialize in building high-end mobile and web applications using Flutter and the MERN stack. My approach combines technical excellence with a deep understanding of user psychology to create digital products that aren't just functional, but delightful to use.",
          style: AppStyles.body.copyWith(fontSize: 17),
        ),
        SizedBox(height: size.height * 0.04),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildExpertiseCard("High Performance", FontAwesomeIcons.bolt, AppColors.primary, size),
            _buildExpertiseCard("Responsive Design", FontAwesomeIcons.expand, AppColors.accent, size),
            _buildExpertiseCard("Clean Architecture", FontAwesomeIcons.code, AppColors.secondary, size),
            _buildExpertiseCard("Modern Technology", FontAwesomeIcons.microchip, Colors.orangeAccent, size),
          ],
        ),
        SizedBox(height: size.height * 0.05),
        _buildDetailsGrid(size),
        SizedBox(height: size.height * 0.05),
        _buildHireButton(size),
      ],
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1);
  }

  Widget _buildExpertiseCard(String title, IconData icon, Color color, Size size) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: isHovered ? color.withValues(alpha: 0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? color : Colors.white.withValues(alpha: 0.05), 
            width: 1.5
          ),
          boxShadow: isHovered ? [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 15,
              offset: const Offset(0, 5),
            )
          ] : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            SizedBox(width: size.width * 0.01),
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).moveY(end: -5),
    );
  }

  Widget _buildDetailsGrid(Size size) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _detailItem("NAME", "Muhammad Ehsan", FontAwesomeIcons.user, AppColors.primary, size),
          _detailItem("EMAIL", "mehsan4270@gmail.com", FontAwesomeIcons.envelope, AppColors.accent, size),
          _detailItem("LOCATION", "Lahore,Punjab,Pk", FontAwesomeIcons.locationDot, Colors.orangeAccent, size),
          _detailItem("AVAILABILITY", "Turning Ideas Into Reality", FontAwesomeIcons.briefcase, AppColors.secondary, size),
        ],
      ),
    );
  }

  Widget _detailItem(String label, String value, IconData icon, Color color, Size size) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isHovered ? color.withValues(alpha: 0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            SizedBox(width: size.width * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: isHovered ? color : AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.02, 1.02)),
    );
  }

  Widget _buildHireButton(Size size) {
    return HoverItem(
      builder: (isHovered) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "LET'S WORK TOGETHER",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
            SizedBox(width: size.width * 0.01),
            const Icon(FontAwesomeIcons.arrowRight, color: Colors.white, size: 14),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.05, 1.05)),
    );
  }
}
