import 'package:flutter/material.dart';

class HoveredAnimationScreen extends StatefulWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback? onPressed;

  const HoveredAnimationScreen({
    super.key,
    required this.child,
    required this.onPressed,
    required this.color,
    required this.width,
    required this.height,
    this.borderRadius = 12,
  });

  @override
  State<HoveredAnimationScreen> createState() => _HoveredAnimationScreenState();
}

class _HoveredAnimationScreenState extends State<HoveredAnimationScreen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: widget.onPressed,
        child: AnimatedContainer(
          width: widget.width,
          height: widget.height,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: isHovered ? widget.color : Colors.transparent,
          ),
          transform: isHovered 
              ? Matrix4.translationValues(0, -5, 0) 
              : Matrix4.identity(),
          child: widget.child,
        ),
      ),
    );
  }
}
