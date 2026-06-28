import 'package:flutter/material.dart';
import '../animation/hover_animation.dart';
import '../components/launch_url.dart';

class Row3ProjectScreen extends StatelessWidget {
  const Row3ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30, // Horizontal spacing
      runSpacing: 30, // Vertical spacing when wrapping
      alignment: WrapAlignment.center,
      children: [
        _buildProjectCard(
          "Todo App with Hive",
          "assets/images/todo.two.png",
          "Our Todo App helps users organize daily tasks with a simple and intuitive interface. It uses Hive local storage to securely save tasks offline, allowing users to add, update, delete, and manage their todos efficiently.",
          "https://github.com/MEhsan1237/Update_TodoApp",
        ),
        _buildProjectCard(
          "Food Panda UI",
          "assets/images/food.one.png",
          "Foodpanda App clone is a reliable platform for ordering food. It connects users with a wide range of restaurants and cuisines with a convenient interface.",
          "https://github.com/MEhsan1237/Food_Panda_App",
        ),
      ],
    );
  }

  Widget _buildProjectCard(String title, String image, String desc, String url) {
    return HoveredAnimationScreen(
      onPressed: () {},
      color: Colors.blueAccent.withOpacity(0.1),
      width: 320,
      height: 480,
      borderRadius: 20,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: 300,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 10),
            RowLaunchScreen(url: url, icon: Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
