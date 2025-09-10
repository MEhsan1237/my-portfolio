
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:practice_web/widgets/sun_image.dart';
import '../animation/slide_fade_animation.dart';
import '../row_components/row1products_screen.dart';
import '../row_components/row2products_screen.dart';
import '../row_components/row3products_screen.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        body: AnimationLimiter(
          child: ListView(
            children: [
              SunImageWidget(),
              MyCustomWidgetScreen(
                index: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Center(
                    child: Text(
                      "My Projects",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              RowProjectScreen(),
              SizedBox(height: 20),
              Row2ProjectScreen(),
              SizedBox(height: 10),
              Row3ProjectScreen(),
            ],
          ),
        ),
      ),
    );
  }
}