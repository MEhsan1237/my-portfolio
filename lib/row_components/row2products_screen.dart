import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import '../components/launch_url.dart';

class Row2ProjectScreen extends StatelessWidget {
  const Row2ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: [
        _projectCard(
          "Task Manager",
          "assets/images/todo.two.png",
          "Efficient task tracking with local storage and clean architecture.",
          "https://github.com/MEhsan1237/Update_TodoApp",
          ["Flutter", "Hive", "Clean Code"],
        ),
        _projectCard(
          "Quiz App",
          "assets/images/quiz.one.png",
          "Interactive quiz application with real-time scoring and leaderboards.",
          "https://github.com/MEhsan1237/Quiz-App-",
          ["Flutter", "Firebase", "Animations"],
        ),
        _projectCard(
          "Covid App",
          "assets/images/virus.two.png",
          "Real-time COVID-19 tracking application and interactive charts",
          "https://github.com/MEhsan1237/covid_app",
          ["Flutter", "Vaccine", "Graphs"],
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
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
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
                        color: AppColors.accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.inter(
                          color: AppColors.accent,
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
