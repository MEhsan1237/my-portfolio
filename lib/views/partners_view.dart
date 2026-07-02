import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../view_models/partners_view_model.dart';
import '../models/partner_model.dart';

class PartnersView extends StatefulWidget {
  final bool animate;
  const PartnersView({super.key, this.animate = false});

  @override
  State<PartnersView> createState() => _PartnersViewState();
}

class _PartnersViewState extends State<PartnersView> {
  final PartnersViewModel viewModel = PartnersViewModel();
  late ScrollController _controller1;
  late ScrollController _controller2;
  late Timer _timer;
  double _offset1 = 0;
  double _offset2 = 0;
  final double _speed = 0.8;

  @override
  void initState() {
    super.initState();
    _controller1 = ScrollController();
    _controller2 = ScrollController();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _offset1 = 5000; 
      _controller1.jumpTo(_offset1);
      _startScrolling();
    });
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_controller1.hasClients && _controller2.hasClients) {
        _offset1 -= _speed;
        _controller1.jumpTo(_offset1);
        _offset2 += _speed;
        _controller2.jumpTo(_offset2);

        if (_offset1 <= 100) _offset1 = 5000;
        if (_offset2 >= _controller2.position.maxScrollExtent - 100) _offset2 = 0;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionAnimation(
      animate: widget.animate,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        margin: const EdgeInsets.only(bottom: 80), // Increased space before Contact
        child: Column(
          children: [
            // Row 1: Left to Right
            SizedBox(
              height: 60,
              child: ListView.builder(
                controller: _controller1,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final partner = viewModel.partners[index % viewModel.partners.length];
                  return _buildPartnerItem(partner);
                },
              ),
            ),
            const SizedBox(height: 30),
            // Row 2: Right to Left
            SizedBox(
              height: 60,
              child: ListView.builder(
                controller: _controller2,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final partner = viewModel.partners[index % viewModel.partners.length];
                  return _buildPartnerItem(partner);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartnerItem(PartnerModel partner) {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center, // Centers vertically
          children: [
            Icon(
              partner.icon,
              color: isHovered 
                ? partner.color 
                : partner.color.withValues(alpha: 0.4),
              size: 22, // Slightly smaller icons for sharpness
            ),
            const SizedBox(width: 14),
            Text(
              partner.name,
              style: AppStyles.navItem.copyWith(
                color: isHovered 
                  ? Colors.white 
                  : Colors.white.withValues(alpha: 0.4),
                fontSize: 20, // Slightly larger text
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
