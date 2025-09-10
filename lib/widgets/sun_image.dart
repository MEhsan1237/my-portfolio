import 'package:flutter/material.dart';

import '../animation/slide_fade_animation.dart';

class SunImageWidget extends StatelessWidget {
  const SunImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomWidgetScreen(
      index: 0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sun.one.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  shape:  BoxShape.circle,
                  boxShadow: [
                    BoxShadow(

                      color: Colors.tealAccent,
                      spreadRadius: 3,
                      blurRadius: 3,
                    )
                  ]
              ),

            ),
          ),

        ],
      ),
    );
  }
}




