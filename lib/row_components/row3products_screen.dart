import 'package:flutter/material.dart';

import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';
import '../components/launch_url.dart';

class Row3ProjectScreen extends StatelessWidget {
  const Row3ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomWidgetScreen(
      index: 4,
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
                        "assets/images/calculator.one.png",
                        width: 305,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Calculator App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    "Our Calculator App is a simple and reliable tool for quick and accurate calculations. It supports basic arithmetic operations like addition, subtraction, multiplication, and division with an easy-to-use interface. Designed for all ages, it helps users solve daily math problems efficiently and instantly.",
                  ),
                  SizedBox(height: 10,),
                  RowLaunchScreen(url: 'https://github.com/MEhsan1237/Calculated-App', icon:Icons.arrow_forward,),
                ],
              ),
            ),
          ),
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
                        "assets/images/food.one.png",
                        width: 305,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Food Panda App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    "Foodpanda App is a simple, reliable platform for ordering food. It connects users with a wide range of restaurants and cuisines, offering an easy-to-use interface for browsing menus and placing orders. Designed for all ages, it helps users enjoy fast, convenient, hassle-free delivery anytime, anywhere.",
                  ),
                  SizedBox(height: 10,),
                  RowLaunchScreen(url: 'https://github.com/MEhsan1237/Food_Panda_App', icon:Icons.arrow_forward,),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
