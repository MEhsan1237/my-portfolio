import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 900;
    
    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.8),
      width: double.infinity,
      // Increased top padding to give space from AppBar
      padding: EdgeInsets.only(
        top: 120, 
        bottom: 50,
        left: isSmallScreen ? 20 : size.width * 0.1,
        right: isSmallScreen ? 20 : size.width * 0.1,
      ),
      child: MyCustomWidgetScreen(
        index: 0,
        direction: RevealDirection.left,
        child: isSmallScreen 
          ? Column(
              children: [
                _buildProfileImage(size),
                const SizedBox(height: 60),
                _buildTextContent(context, true),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 3, child: _buildTextContent(context, false)),
                Expanded(flex: 2, child: _buildProfileImage(size)),
              ],
            ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool centered) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          "WELCOME TO MY PORTFOLIO",
          style: TextStyle(
            color: Colors.tealAccent,
            fontSize: 14,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: centered ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Hi, I'm ",
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: "Muhammad Ehsan",
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Wrapped in Wrap for responsiveness to prevent overflow
        Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
              "a ",
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText("Front End Web Developer."),
                  TypewriterAnimatedText("Flutter Developer."),
                  TypewriterAnimatedText("Mobile Application Developer."),
                  TypewriterAnimatedText("MERN Stack Developer."),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Text(
          "I build high-performance, beautiful, and scalable mobile & web applications. "
          "Specialized in Flutter and MERN stack with a passion for creating seamless user experiences.",
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 40),
        _buildDownloadCVButton(),
      ],
    );
  }

  Widget _buildProfileImage(Size size) {
    double imgSize = size.width < 600 ? 250 : 300;
    return MyCustomWidgetScreen(
      index: 1,
      direction: RevealDirection.right,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: imgSize + 20,
              height: imgSize + 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent.withOpacity(0.5), Colors.tealAccent.withOpacity(0.5)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent.withOpacity(0.3),
                    blurRadius: 50,
                    spreadRadius: 10,
                  )
                ],
              ),
            ),
            Container(
              width: imgSize,
              height: imgSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white10, width: 8),
                image: const DecorationImage(
                  image: AssetImage("assets/images/me_dp.one.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadCVButton() {
    return HoveredAnimationScreen(
      onPressed: () {},
      color: Colors.deepPurpleAccent,
      width: 180,
      height: 55,
      borderRadius: 12,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurpleAccent, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.download, color: Colors.white, size: 20),
            SizedBox(width: 10),
            Text(
              "DOWNLOAD CV",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
