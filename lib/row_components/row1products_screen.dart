import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import '../components/custom_animations.dart';
import '../components/launch_url.dart';

class RowProjectScreen extends StatelessWidget {
  const RowProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: [
        _projectCard(
          "News App",
          "assets/images/news.one.png",
          "Real-time news aggregator with category filtering and beautiful UI.",
          "https://github.com/MEhsan1237/news-app",
          ["Flutter", "Rest API", "NewsAPI"],
        ),
        _projectCard(
          "Blood Donation",
          "assets/images/blood.one.png",
          "Connecting donors with recipients through real-time notifications.",
          "https://github.com/MEhsan1237/Blood_Donation_App",
          ["Flutter", "Firebase", "Maps"],
        ),
        _projectCard(
          "E-Commerce App",
          "assets/images/eproducts1.png",
          "Premium shopping experience with smooth transitions and clean code.",
          "https://github.com/MEhsan1237/UI-Kit-E-commerce",
          ["Flutter", "Provider", "Animations"],
        ),
      ],
    );
  }

  Widget _projectCard(String title, String image, String desc, String url, List<String> tags) {
    return HoverItem(
      builder: (isHovered) => Container(
        width: 320,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: isHovered ? AppColors.primary.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 30 : 20,
              offset: isHovered ? const Offset(0, 15) : const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.asset(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: tags.map((tag) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.inter(
                          color: AppColors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    desc,
                    style: AppStyles.body.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  RowLaunchScreen(url: url, icon: Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).moveY(end: -10, duration: 300.ms),
    );
  }
}
