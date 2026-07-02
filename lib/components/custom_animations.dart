import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/constants.dart';

class HoverItem extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HoverItem({super.key, required this.builder});

  @override
  State<HoverItem> createState() => _HoverItemState();
}

class _HoverItemState extends State<HoverItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: widget.builder(_isHovered),
    );
  }
}

class SectionAnimation extends StatelessWidget {
  final Widget child;
  final bool animate;
  final Duration delay;

  const SectionAnimation({
    super.key,
    required this.child,
    required this.animate,
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate(target: animate ? 1 : 0)
        .fadeIn(delay: delay, duration: 1000.ms)
        .slideY(begin: 0.2, end: 0, delay: delay, duration: 1000.ms);
  }
}

class CustomHoverCard extends StatelessWidget {
  final Widget child;
  final Widget Function(bool isHovered)? builder;
  final Color highlightColor;
  final bool animate;
  final Duration delay;
  final EdgeInsets? padding;
  final double? width;
  final bool liftUp;

  const CustomHoverCard({
    super.key,
    this.child = const SizedBox.shrink(),
    this.builder,
    required this.highlightColor,
    this.animate = true,
    this.delay = Duration.zero,
    this.padding,
    this.width,
    this.liftUp = true,
  });

  @override
  Widget build(BuildContext context) {
    return SectionAnimation(
      animate: animate,
      delay: delay,
      child: HoverItem(
        builder: (isHovered) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
          width: width,
          padding: padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHovered
                  ? highlightColor.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.05),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? highlightColor.withValues(alpha: 0.15)
                    : Colors.black.withValues(alpha: 0.2),
                blurRadius: isHovered ? 40 : 20,
                offset: Offset(0, isHovered ? 20 : 10),
              )
            ],
          ),
          transform: (liftUp && isHovered)
              ? (Matrix4.identity()..translate(10.0, -10.0, 0.0))
              : Matrix4.identity(),
          child: builder != null ? builder!(isHovered) : child,
        ),
      ),
    );
  }
}
