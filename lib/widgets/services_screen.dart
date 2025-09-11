import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';




class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: AnimationLimiter(
            child: ListView(
              children:[ MyCustomWidgetScreen(
                index: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                     crossAxisAlignment:  CrossAxisAlignment.center,
                    children: [

                      HoveredAnimationScreen(
                        onPressed: () {  },
                        color: Colors.red,
                        width: 220,
                        height: 320,
                        child: Column(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center, // sab ek hi line se start
                          children: const [

                            Text(
                              "Front-End Services",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("• Android Development",style: TextStyle(color: Colors.white),),
                            Text("• UI Implementation",style: TextStyle(color: Colors.white)),
                            Text("• API Integration",style: TextStyle(color: Colors.white)),
                            Text("• State Management (Provider)",style: TextStyle(color: Colors.white)),
                            Text("• Custom Widgets Understanding",style: TextStyle(color: Colors.white)),
                            Text("• Themes Implementation",style: TextStyle(color: Colors.white)),
                            Text("• Custom UI for real life projects",style: TextStyle(color: Colors.white)),
                            Text("• Routes and Navigation",style: TextStyle(color: Colors.white)),
                            Text("• Animations(hero,tween etc)",style: TextStyle(color: Colors.white)),
                            Text("• Performance Optimization",style: TextStyle(color: Colors.white)),

                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      HoveredAnimationScreen(
                        onPressed: () {  },
                        color: Colors.red,
                        width: 220,
                        height: 320,
                        child: Column(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center, // sab ek hi line se start
                          children: const [

                            Text(
                              "Back-End Services",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("• Android Development",style: TextStyle(color: Colors.white),),
                            Text("• UX Implementation",style: TextStyle(color: Colors.white)),
                            Text("• Firebase Integration",style: TextStyle(color: Colors.white)),
                            Text("• Authentication, FireStore",style: TextStyle(color: Colors.white)),
                            Text("• Performance Optimization",style: TextStyle(color: Colors.white)),
                            Text("• Google Maps Integration",style: TextStyle(color: Colors.white)),
                            Text("• Stripe Payment Gateway",style: TextStyle(color: Colors.white)),
                            Text("• Social Media Logins",style: TextStyle(color: Colors.white)),
                            Text("• CI/CD(integration)",style: TextStyle(color: Colors.white)),
                            Text("• App Deployment",style: TextStyle(color: Colors.white)),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}

