import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 950;
    
    // Card width calculation for 2x2 grid
    final double cardWidth = isSmallScreen ? size.width * 0.9 : (size.width * 0.42);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20),
      child: Column(
        children: [
          MyCustomWidgetScreen(
            index: 0,
            direction: RevealDirection.top,
            child: Column(
              children: [
                const Text(
                  "SERVICES",
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "High-Quality Digital Solutions",
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
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          AnimationLimiter(
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
                _buildModernService(
                  1,
                  RevealDirection.left,
                  "Mobile App Development",
                  FontAwesomeIcons.mobileScreenButton,
                  const Color(0xFF6C63FF),
                  cardWidth,
                  [
                    "Expert Flutter Cross-platform Apps",
                    "Native Performance & Smooth UI",
                    "Complex Firebase Integrations",
                    "Custom Animations & Rive Assets",
                    "Responsive Mobile Architecture",
                  ],
                ),
                _buildModernService(
                  2,
                  RevealDirection.right,
                  "Front-End Web Development",
                  FontAwesomeIcons.laptopCode,
                  const Color(0xFF00D2FF),
                  cardWidth,
                  [
                    "Modern Responsive Web Apps",
                    "React.js & Next.js Expertise",
                    "Tailwind CSS & Material UI",
                    "Pixel-Perfect Figma to Code",
                    "Interactive User Experiences",
                  ],
                ),
                _buildModernService(
                  3,
                  RevealDirection.left,
                  "MERN Stack Development",
                  FontAwesomeIcons.layerGroup,
                  const Color(0xFF00F260),
                  cardWidth,
                  [
                    "End-to-End Full Stack Solutions",
                    "Robust Node.js & Express Backends",
                    "MongoDB Database Architecture",
                    "Secure Authentication Systems",
                    "Scalable Web Infrastructure",
                  ],
                ),
                _buildModernService(
                  4,
                  RevealDirection.right,
                  "Cloud & API Services",
                  FontAwesomeIcons.cloudArrowUp,
                  const Color(0xFFF7971E),
                  cardWidth,
                  [
                    "Firebase & Supabase Ecosystem",
                    "Restful & GraphQL API Design",
                    "Real-time Data Synchronizations",
                    "Serverless Functions & Storage",
                    "Secure Payment Integrations",
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernService(
      int index, RevealDirection direction, String title, IconData icon, Color accentColor, double width, List<String> items) {
    return MyCustomWidgetScreen(
      index: index,
      direction: direction,
      child: HoveredAnimationScreen(
        onPressed: () {},
        color: accentColor.withOpacity(0.02),
        width: width.clamp(350, 550),
        height: 450, // Increased height to ensure no scrolling is needed
        borderRadius: 30,
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.05), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: accentColor.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(icon, color: accentColor, size: 30),
                  ),
                  Icon(Icons.arrow_outward, color: Colors.white.withOpacity(0.2), size: 24),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 30),
              // Replaced ListView with Column to completely remove internal scrolling
              Column(
                children: items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: accentColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.5),
                              blurRadius: 4,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
