import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 900;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20),
      child: MyCustomWidgetScreen(
        index: 1,
        direction: RevealDirection.bottom,
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            _buildStatCard(
              "12+",
              "Projects Completed",
              FontAwesomeIcons.checkDouble,
              Colors.tealAccent,
              isSmallScreen ? size.width * 0.9 : 280,
            ),
            _buildStatCard(
              "2+",
              "Years Learning & Dev",
              FontAwesomeIcons.laptopCode,
              Colors.blueAccent,
              isSmallScreen ? size.width * 0.9 : 280,
            ),
            _buildStatCard(
              "8+",
              "Flutter Applications",
              FontAwesomeIcons.mobileScreenButton,
              Colors.deepPurpleAccent,
              isSmallScreen ? size.width * 0.9 : 280,
            ),
            _buildStatCard(
              "5+",
              "Web Applications",
              FontAwesomeIcons.globe,
              Colors.orangeAccent,
              isSmallScreen ? size.width * 0.9 : 280,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color accentColor, double width) {
    return HoveredAnimationScreen(
      onPressed: () {},
      color: accentColor.withOpacity(0.05),
      width: width,
      height: 160,
      borderRadius: 25,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: accentColor.withOpacity(0.2), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: accentColor, size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      shadows: [
                        Shadow(color: accentColor.withOpacity(0.5), blurRadius: 10)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
