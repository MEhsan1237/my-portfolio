import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../animation/slide_fade_animation.dart';
import '../row_components/row1products_screen.dart';
import '../row_components/row2products_screen.dart';
import '../row_components/row3products_screen.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

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
                  "FEATURED PROJECTS",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "My Creative Portfolio",
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
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          AnimationLimiter(
            child: Column(
              children: [
                MyCustomWidgetScreen(
                  index: 1,
                  direction: RevealDirection.left,
                  child: const RowProjectScreen(),
                ),
                const SizedBox(height: 30), // Spacing between rows
                MyCustomWidgetScreen(
                  index: 2,
                  direction: RevealDirection.right,
                  child: const Row2ProjectScreen(),
                ),
                const SizedBox(height: 30), // Spacing between rows
                MyCustomWidgetScreen(
                  index: 3,
                  direction: RevealDirection.left,
                  child: const Row3ProjectScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
