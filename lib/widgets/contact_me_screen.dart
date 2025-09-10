import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';
import '../components/new2_launch_url.dart';
import '../components/new3_launch_url.dart';
import '../components/new_launch_url.dart';

class ContactMeScreen extends StatelessWidget {
  const ContactMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: MyCustomWidgetScreen(
          index: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: HoveredAnimationScreen(
                onPressed: () {},
                color: Colors.red,
                width: 380,
                height: 370,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Muhammad Ehsan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 15, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.call, color: Colors.white),
                          SizedBox(width: 20, height: 10),
                          Column(
                            children: [
                              Text(
                                "+923039095463",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "+923361615363",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.email, color: Colors.white),
                          SizedBox(width: 20, height: 10),
                          Text(
                            "mehsan4270@gmail.com",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 15, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.location_pin, color: Colors.white),
                          SizedBox(width: 20, height: 10),
                          Text(
                            "Burewala, Pakistan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 15, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                          SizedBox(width: 20, height: 10),
                          Text(
                            "linkedin.com/in/muhammad-ehsan-41680731b",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(height: 15, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(FontAwesomeIcons.github, color: Colors.white),
                          SizedBox(width: 20, height: 10),
                          Text(
                            "https://github.com/MEhsan1237",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(height: 15, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(FontAwesomeIcons.tiktok, color: Colors.white),
                          SizedBox(width: 20, height: 10),
                          Text(
                            "tiktok.com/@mehsan1237",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NewRowLaunchScreen3(icon: FontAwesomeIcons.linkedin),
                          SizedBox(width: 10),
                          NewRowLaunchScreen(icon: FontAwesomeIcons.github),
                          SizedBox(width: 10),
                          NewRowLaunchScreen2(icon: FontAwesomeIcons.tiktok),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}