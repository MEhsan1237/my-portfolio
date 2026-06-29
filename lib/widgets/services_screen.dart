import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class ServiceData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  ServiceData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 700;
    final bool isTablet = size.width < 1100 && size.width >= 700;

    final List<ServiceData> services = [
      ServiceData(
        title: "Full Stack Development",
        description: "Building robust end-to-end applications with modern frontend and backend technologies.",
        icon: FontAwesomeIcons.layerGroup,
        color: AppColors.primary,
      ),
      ServiceData(
        title: "REST API Development",
        description: "Designing secure, scalable, and high-performance APIs to power seamless data exchange.",
        icon: FontAwesomeIcons.server,
        color: AppColors.accent,
      ),
      ServiceData(
        title: "Mobile Development",
        description: "Crafting high-performance, native-quality cross-platform mobile apps using Flutter.",
        icon: FontAwesomeIcons.mobileScreen,
        color: AppColors.secondary,
      ),
      ServiceData(
        title: "Database Integration",
        description: "Optimizing data storage and retrieval with efficient SQL and NoSQL database architectures.",
        icon: FontAwesomeIcons.database,
        color: Colors.orangeAccent,
      ),
      ServiceData(
        title: "WebSockets Apps",
        description: "Live chat, notifications, and collaborative features with Socket.io, seamless user interactions.",
        icon: FontAwesomeIcons.shieldHalved,
        color: Colors.greenAccent,
      ),
      ServiceData(
        title: "UI/UX Designs",
        description: "Creating intuitive, visually stunning, and user-centric interfaces that enhance engagement.",
        icon: FontAwesomeIcons.penNib,
        color: Colors.pinkAccent,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 20 : size.width * 0.08,
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 80),
          LayoutBuilder(
            builder: (context, constraints) {
              // Row logic: 3 per row on Desktop, 2 on Tablet, 1 on Mobile
              double cardWidth;
              if (isMobile) {
                cardWidth = constraints.maxWidth;
              } else if (isTablet) {
                cardWidth = (constraints.maxWidth - 30) / 2;
              } else {
                cardWidth = (constraints.maxWidth - 60) / 3;
              }

              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: List.generate(services.length, (index) {
                  return _ServiceCard(
                    data: services[index],
                    width: cardWidth,
                  ).animate()
                   .fadeIn(delay: (index * 100).ms, duration: 600.ms)
                   .slideY(begin: 0.1, end: 0);
                }),
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
            "SERVICES",
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
          "Solutions I Provide",
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
}

class _ServiceCard extends StatelessWidget {
  final ServiceData data;
  final double width;

  const _ServiceCard({required this.data, required this.width});

  @override
  Widget build(BuildContext context) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: isHovered ? data.color.withValues(alpha: 0.05) : AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? data.color.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? data.color.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 30 : 20,
              offset: Offset(0, isHovered ? 15 : 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isHovered ? data.color : data.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: isHovered ? [
                  BoxShadow(
                    color: data.color.withValues(alpha: 0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ] : [],
              ),
              child: Icon(
                data.icon, 
                color: isHovered ? Colors.white : data.color, 
                size: 24
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Title
            Text(
              data.title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Description
            Text(
              data.description,
              style: AppStyles.body.copyWith(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.5),
                height: 1.6,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Animated indicator or arrow
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: isHovered ? 40 : 0,
              color: data.color,
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0)
       .moveY(end: -10, duration: 300.ms, curve: Curves.easeOutCubic),
    );
  }
}
