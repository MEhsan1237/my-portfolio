import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';

class MethodologyScreen extends StatelessWidget {
  const MethodologyScreen({super.key});

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
                  "EXPERTISE",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Technologies I Master",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
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
          const SizedBox(height: 60),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildHoverTechBox("Flutter", FontAwesomeIcons.flutter, Colors.blue),
              _buildHoverTechBox("Dart", Icons.code, Colors.cyan),
              _buildHoverTechBox("React.js", FontAwesomeIcons.react, Colors.blueAccent),
              _buildHoverTechBox("Node.js", FontAwesomeIcons.nodeJs, Colors.green),
              _buildHoverTechBox("MongoDB", FontAwesomeIcons.database, Colors.greenAccent),
              _buildHoverTechBox("Firebase", FontAwesomeIcons.fire, Colors.orange),
              _buildHoverTechBox("Supabase", Icons.bolt, Colors.green),
              _buildHoverTechBox("Git/GitHub", FontAwesomeIcons.github, Colors.white),
              _buildHoverTechBox("REST APIs", Icons.api, Colors.redAccent),
              _buildHoverTechBox("UI/UX", Icons.draw, Colors.pinkAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHoverTechBox(String name, IconData icon, Color color) {
    return HoveredAnimationScreen(
      onPressed: () {},
      color: color.withOpacity(0.1),
      width: 160,
      height: 60,
      borderRadius: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
          color: Colors.white.withOpacity(0.02),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 10),
            Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
