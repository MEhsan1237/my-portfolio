import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20),
      child: Column(
        children: [
          MyCustomWidgetScreen(
            index: 0,
            direction: RevealDirection.top,
            child: Column(
              children: [
                const Text(
                  "TECHNICAL SKILLS",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Languages & Technologies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: [
              _buildModernSkillCard("Dart", FontAwesomeIcons.dartLang, Colors.blue, 0.90),
              _buildModernSkillCard("Node.js", FontAwesomeIcons.nodeJs, Colors.green, 0.85),
              _buildModernSkillCard("MongoDB", FontAwesomeIcons.database, Colors.greenAccent, 0.80),
              _buildModernSkillCard("JavaScript", FontAwesomeIcons.js, Colors.yellow, 0.85),
              _buildModernSkillCard("HTML5", FontAwesomeIcons.html5, Colors.orange, 0.95),
              _buildModernSkillCard("CSS3", FontAwesomeIcons.css3Alt, Colors.blueAccent, 0.90),
              _buildModernSkillCard("Tailwind CSS", FontAwesomeIcons.wind, Colors.cyanAccent, 0.85),
              _buildModernSkillCard("C++", Icons.code, Colors.indigoAccent, 0.75),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModernSkillCard(String title, IconData icon, Color accentColor, double progress) {
    return HoveredAnimationScreen(
      onPressed: () {},
      color: accentColor.withOpacity(0.05),
      width: 280,
      height: 180,
      borderRadius: 24,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: accentColor.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.03),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: accentColor, size: 35),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: TextStyle(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 8,
                  width: 230 * progress, // Approximation for the bar width
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [accentColor, accentColor.withOpacity(0.5)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withOpacity(0.3),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
