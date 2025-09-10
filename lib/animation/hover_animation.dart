import 'package:flutter/material.dart';

class HoveredAnimationScreen extends StatefulWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;



  final VoidCallback? onPressed;

  const HoveredAnimationScreen(
      {super.key, required this.child, required this.onPressed, required this.color, required this.width, required this.height,    });

  @override
  State<HoveredAnimationScreen> createState() => _HoveredAnimationScreenState();
}

class _HoveredAnimationScreenState extends State<HoveredAnimationScreen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) =>
          setState(() {
            isHovered = true;
          }),
      onExit: (_) =>
          setState(() {
            isHovered = false;
          }),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: widget.onPressed,
        child: AnimatedContainer(
          width: widget.width,
            height: widget.height,
            duration: Duration(milliseconds: 300,
        ),

          decoration: BoxDecoration(
            borderRadius: isHovered?BorderRadius.circular(30):BorderRadius.circular(30),
            color: isHovered ? widget.color : null,

          ),
          transform: isHovered ? Matrix4.translationValues(0, -6, 0)
              : Matrix4.identity(),


         child: widget.child
         ),
      ) ,


    );
  }
}


