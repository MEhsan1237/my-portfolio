import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyCustomWidgetScreen extends StatefulWidget {
  final int index;
  final Widget child;

  const MyCustomWidgetScreen(
      {super.key, required this.index, required this.child});

  @override
  State<MyCustomWidgetScreen> createState() => _MyCustomWidgetScreenState();
}

class _MyCustomWidgetScreenState extends State<MyCustomWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: widget.index,duration: Duration(milliseconds: 900,),
        child: SlideAnimation(verticalOffset: 100,child: FadeInAnimation(child: widget.child,))
    );
  }
}
