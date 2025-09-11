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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child:    HoveredAnimationScreen(
          onPressed: () {},
          color: Colors.red,
          width: 300,
          height: 450,
          child: Container(
            width: 280,
            height: 350,
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
      ),
    );
  }
}
