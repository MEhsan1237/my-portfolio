import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/widgets/sun_image.dart';

import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';
import '../components/new2_launch_url.dart';
import '../components/new3_launch_url.dart';
import '../components/new_launch_url.dart';
import '../row_components/row1products_screen.dart';
import '../row_components/row2products_screen.dart';
import '../row_components/row3products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(vertical:  50.0, horizontal: MediaQuery.of(context).size.width * 0.1),
      child: MyCustomWidgetScreen(
        index: 0,
        child: HoveredAnimationScreen(
          onPressed: () {  },
          color: Colors.red,
          width: double.infinity,
          height: 400,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Padding(
                                padding:   EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * 0.1,
                                  vertical: 14,
                                ),
                                child: Text(
                                  "Muhammad Ehsan",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0),
                                child: Positioned(
                                  top: 200,
                                  left: 20,
                                  child: Row(
                                    children: [
                                      Text(
                                        "I am",
                                        style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          foreground:
                                          Paint()
                                            ..shader = const LinearGradient(
                                              colors: [
                                                Colors.teal,
                                                Colors.deepPurple,
                                              ],
                                            ).createShader(
                                              const Rect.fromLTWH(
                                                150.0,
                                                0.0,
                                                200.0,
                                                70.0,
                                              ),
                                            ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: AnimatedTextKit(
                                            repeatForever: true,
                                            pause: Duration(seconds: 1),
                                            animatedTexts: [
                                              TyperAnimatedText(
                                                "Full Stack Developer",
                                              ),
                                              TyperAnimatedText(
                                                "Flutter Developer",
                                              ),
                                              TyperAnimatedText(
                                                "Android Developer",
                                              ),
                                              TyperAnimatedText("Web Developer"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 16),
                                child: Text(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                  textAlign: TextAlign.center,
                                  "I am a Full Stack Flutter Developer skilled in building cross-platform apps \n"
                                      "with all Flutter widgets, Provider state management, and Google Maps. \n"
                                      "I specialize in Firebase (Auth, Firestore, Realtime DB, Storage, Cloud.) \n"
                                      "API integration to deliver secure, real-time, and scalable solutions. \n"
                                      "My focus is on creating real-world projects, CRUD features, \n"
                                      "payment systems, and smooth performance.",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Positioned(
                            top: 50,
                            left: 60,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.tealAccent,
                                    spreadRadius: 4,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/images/me_dp.one.png",
                                ),
                                radius: 120,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 700.0,top: 10),
                          child: Text(
                            "Social Media Accounts",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 200.0),
                          child: Row(
                            children: [
                              NewRowLaunchScreen(icon: FontAwesomeIcons.github,),
                              SizedBox(width: 10,),
                              NewRowLaunchScreen2(icon: FontAwesomeIcons.tiktok,),
                              SizedBox(width: 10,),
                              NewRowLaunchScreen3(icon: FontAwesomeIcons.linkedin,)

                            ],),
                        )
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}