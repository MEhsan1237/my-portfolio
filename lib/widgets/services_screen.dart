import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
          LayoutBuilder(
            builder: (context, constraints) {
              // Calculate width to force 2 per row on Desktop/Tablet
              final double spacing = 40;
              final double cardWidth = isMobile 
                  ? constraints.maxWidth 
                  : (constraints.maxWidth - spacing) / 2;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                alignment: WrapAlignment.center,
                children: [
                  _serviceCard(
                    "Mobile App Development",
                    "Creating high-performance, native-like cross-platform applications with Flutter.",
                    [
                      "Custom UI/UX Animations",
                      "Firebase & API Integration",
                      "State Management (Riverpod/Bloc)",
                      "App Store & Play Store Deployment"
                    ],
                    FontAwesomeIcons.mobileScreenButton,
                    AppColors.primary,
                    cardWidth,
                  ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2),
                  _serviceCard(
                    "Web Development",
                    "Building responsive, SEO-friendly, and modern web applications using the latest tech.",
                    [
                      "React & Next.js Expertise",
                      "Flutter Web Solutions",
                      "Tailwind CSS Styling",
                      "Performance Optimization"
                    ],
                    FontAwesomeIcons.laptopCode,
                    AppColors.accent,
                    cardWidth,
                  ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.2),
                  _serviceCard(
                    "MERN Stack Solutions",
                    "Full-stack web applications with robust backends and scalable databases.",
                    [
                      "Scalable Node.js Backends",
                      "MongoDB Database Design",
                      "RESTful API Development",
                      "Secure JWT Authentication"
                    ],
                    FontAwesomeIcons.layerGroup,
                    AppColors.secondary,
                    cardWidth,
                  ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2),
                  _serviceCard(
                    "Cloud & API Services",
                    "Enterprise-grade cloud infrastructure and seamless API integrations.",
                    [
                      "Firebase & Supabase Setup",
                      "RESTful & GraphQL APIs",
                      "Serverless Architecture",
                      "Real-time Data Sync"
                    ],
                    FontAwesomeIcons.cloudArrowUp,
                    Colors.orangeAccent,
                    cardWidth,
                  ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.2),
                ],
              );
            },
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
            "WHAT I OFFER",
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
          "High-Quality Digital Solutions",
          textAlign: TextAlign.center,
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

  Widget _serviceCard(
    String title, 
    String desc, 
    List<String> features, 
    IconData icon, 
    Color color, 
    double cardWidth
  ) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: cardWidth,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? color.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 40 : 20,
              offset: Offset(0, isHovered ? 20 : 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, color: color, size: 32),
                ),
                Icon(
                  Icons.arrow_outward_rounded, 
                  color: isHovered ? color : Colors.white.withValues(alpha: 0.2), 
                  size: 24
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              desc,
              style: AppStyles.body.copyWith(
                fontSize: 15,
                color: Colors.white.withValues(alpha: 0.6),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32),
            Column(
              children: features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_rounded, color: color, size: 18),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: GoogleFonts.inter(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0)
       .moveY(end: -15, duration: 400.ms, curve: Curves.easeOutCubic),
    );
  }
}
