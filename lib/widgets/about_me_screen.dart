import 'package:flutter/material.dart';

import '../animation/hover_animation.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      child: HoveredAnimationScreen(
        onPressed: () {},
        color: Colors.red,
        width: double.infinity,
        height: 400,
        child: Stack(
          children: [
            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Align(alignment:  Alignment.topCenter,
              child: Text(

                "About Me",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Positioned(
              top: 40,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.tealAccent,
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/man3.png"),
                  radius: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

