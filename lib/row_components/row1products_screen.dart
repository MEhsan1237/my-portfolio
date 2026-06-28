import 'package:flutter/material.dart';
import '../animation/hover_animation.dart';
import '../components/launch_url.dart';

class RowProjectScreen extends StatelessWidget {
  const RowProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30, // Horizontal spacing
      runSpacing: 30, // Vertical spacing when wrapping
      alignment: WrapAlignment.center,
      children: [
        _buildProjectCard(
          "News App",
          "assets/images/news.one.png",
          "Our News App is a simple and reliable source for staying updated with the latest headlines. It provides real-time news from categories like politics, sports, technology, and entertainment.",
          "https://github.com/MEhsan1237/news-app",
        ),
        _buildProjectCard(
          "Blood Donation App",
          "assets/images/blood.one.png",
          "Our Blood Donation App connects donors with recipients through a simple and user-friendly interface. It includes real-time chat, notifications, and blood request features to make communication and donations faster and more accessible.",
          "https://github.com/MEhsan1237/Blood_Donation_App",
        ),
        _buildProjectCard(
          "E-Commerce App",
          "assets/images/eproducts1.png",
          "An E-Commerce App built with Flutter that allows users to browse products by categories, add items to the cart, and manage favorites. It supports secure checkout and Firebase integration.",
          "https://github.com/MEhsan1237/UI-Kit-E-commerce",
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
