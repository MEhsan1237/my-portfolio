import 'package:flutter/material.dart';
import '../animation/hover_animation.dart';
import '../components/launch_url.dart';

class Row2ProjectScreen extends StatelessWidget {
  const Row2ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30, // Horizontal spacing
      runSpacing: 30, // Vertical spacing when wrapping
      alignment: WrapAlignment.center,
      children: [
        _buildProjectCard(
          "Doctor Consultant App",
          "assets/images/doctoe.one.png",
          "Our Doctor Consultant App makes healthcare accessible and convenient by connecting patients with doctors anytime, anywhere. Users can book appointments and consult through chat.",
          "https://github.com/MEhsan1237/doctor-UI",
        ),
        _buildProjectCard(
          "Quiz App",
          "assets/images/quiz.one.png",
          "Our Quiz App is a fun and interactive way to test knowledge across different topics. With multiple-choice questions, real-time scoring, and instant feedback, it helps users learn while playing.",
          "https://github.com/MEhsan1237/Quiz-App-",
        ),
        _buildProjectCard(
          "Virus Tracker App",
          "assets/images/virus.two.png",
          "A COVID-19 Tracker App helps users stay updated with the latest coronavirus cases worldwide. It provides real-time statistics such as confirmed cases, recoveries, and deaths.",
          "https://github.com/MEhsan1237/covid_app",
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
