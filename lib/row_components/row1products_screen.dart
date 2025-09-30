import 'package:flutter/material.dart';

import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';
import '../components/launch_url.dart';

class RowProjectScreen extends StatelessWidget {
  const RowProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomWidgetScreen(
      index: 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.red,
            width: 300,
            height: 450,
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/news.one.png",
                        width: 300,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "News App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    "Our News App is a simple and reliable source for staying updated with the latest headlines. It provides real-time news from categories like politics, sports, technology, and entertainment with an easy-to-use interface. Designed for all ages, it helps users stay informed about events quickly and conveniently.",
                  ),
                  SizedBox(height: 10,),
                  RowLaunchScreen(url: 'https://github.com/MEhsan1237/news-app', icon:Icons.arrow_forward,),
                ],
              ),
            ),
          ),
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.red,
            width: 300,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/quiz.one.png",
                      width: 300,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Quiz App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  "Our Quiz App is a fun and interactive way to test knowledge across different topics. With multiple-choice questions, real-time scoring, and instant feedback, it helps users learn while playing. Its simple design and timer feature make quizzes both engaging and challenging for learners of all ages.",
                ),
                SizedBox(height: 10,),
                RowLaunchScreen(url: 'https://github.com/MEhsan1237/Quiz-App-', icon:Icons.arrow_forward,),
              ],
            ),
          ),
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.red,
            width: 300,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/eproducts1.png",
                      width: 300,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "E-Commerce App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  "An E-Commerce App built with Flutter that allows users to browse "
                      "products by categories, add items to the cart, and manage favorites. "
                      "It supports secure checkout, payment integration, and real-time data with "
                      "Firebase and APIs. The app features Provider state management and a modern,"
                      " responsive UI for a smooth shopping experience.",
                ),
                SizedBox(height: 10,),
                RowLaunchScreen(url: 'https://github.com/MEhsan1237/UI-Kit-E-commerce', icon:Icons.arrow_forward,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
