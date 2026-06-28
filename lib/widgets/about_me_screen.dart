import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

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
          isMobile 
            ? Column(
                children: [
                  _buildAboutImage(size),
                  const SizedBox(height: 60),
                  _buildAboutContent(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildAboutImage(size)),
                  const SizedBox(width: 80),
                  Expanded(flex: 3, child: _buildAboutContent()),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
        const SizedBox(height: 16),
        Text(
          "Crafting Digital Excellence",
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 20),
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
    return Stack(
      children: [
        // Decorative background frame
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2), width: 2),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ).animate().fadeIn(delay: 400.ms).move(begin: const Offset(-20, -20), end: const Offset(20, 20), duration: 2.seconds),
        
        // Main Image Container
        Container(
          margin: const EdgeInsets.only(right: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/images/man3.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        // Experience Badge
        Positioned(
          bottom: 40,
          left: -20,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  "3+",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  "Years Exp.",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 600.ms).scale(),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
  }

  Widget _buildAboutContent() {
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
        const SizedBox(height: 24),
        Text(
          "I specialize in building high-end mobile and web applications using Flutter and the MERN stack. My approach combines technical excellence with a deep understanding of user psychology to create digital products that aren't just functional, but delightful to use.",
          style: AppStyles.body.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 32),
        
        // Key Expertise Cards
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildExpertiseCard("High Performance", FontAwesomeIcons.bolt, AppColors.primary),
            _buildExpertiseCard("Responsive Design", FontAwesomeIcons.expand, AppColors.accent),
            _buildExpertiseCard("Clean Architecture", FontAwesomeIcons.code, AppColors.secondary),
          ],
        ),
        
        const SizedBox(height: 48),
        
        // Professional Details Grid
        _buildDetailsGrid(),
        
        const SizedBox(height: 48),
        
        // Modern Action Button
        _buildHireButton(),
      ],
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1);
  }

  Widget _buildExpertiseCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsGrid() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Wrap(
        spacing: 40,
        runSpacing: 24,
        children: [
          _detailItem("NAME", "Muhammad Ehsan"),
          _detailItem("EMAIL", "mehsan4270@gmail.com"),
          _detailItem("LOCATION", "Punjab, Pakistan"),
          _detailItem("AVAILABILITY", "Open to Work"),
        ],
      ),
    );
  }

  Widget _detailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: AppColors.primary,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildHireButton() {
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
            const SizedBox(width: 12),
            const Icon(FontAwesomeIcons.arrowRight, color: Colors.white, size: 14),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.05, 1.05)),
    );
  }
}
