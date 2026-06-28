import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum RevealDirection { bottom, right, left, top }

class MyCustomWidgetScreen extends StatelessWidget {
  final int index;
  final Widget child;
  final RevealDirection direction;

  const MyCustomWidgetScreen({
    super.key,
    required this.index,
    required this.child,
    this.direction = RevealDirection.bottom,
  });

  @override
  Widget build(BuildContext context) {
    double horizontalOffset = 0;
    double verticalOffset = 0;

    switch (direction) {
      case RevealDirection.bottom:
        verticalOffset = 100;
        break;
      case RevealDirection.top:
        verticalOffset = -100;
        break;
      case RevealDirection.left:
        horizontalOffset = -100;
        break;
      case RevealDirection.right:
        horizontalOffset = 100;
        break;
    }

    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 1000),
      child: SlideAnimation(
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
