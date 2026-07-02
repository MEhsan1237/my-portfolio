import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/service_model.dart';
import 'package:practice_web/view_models/services_view_model.dart';

class ServicesView extends StatelessWidget {
  final bool animate;
  final ServicesViewModel viewModel = ServicesViewModel();
  
  ServicesView({super.key, this.animate = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 700;
    final bool isTablet = size.width < 1100 && size.width >= 700;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.06,
        bottom: 50,
        left: isMobile ? 20 : size.width * 0.08,
        right: isMobile ? 20 : size.width * 0.08,
      ),
      child: Column(
        children: [
          SectionAnimation(
            animate: animate,
            child: _buildHeader(size),
          ),
          SizedBox(height: size.height * 0.08),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth;
              if (isMobile) {
                cardWidth = constraints.maxWidth;
              } else if (isTablet) {
                cardWidth = (constraints.maxWidth - 30) / 2;
              } else {
                cardWidth = (constraints.maxWidth - 60) / 3;
              }

              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: List.generate(viewModel.services.length, (index) {
                  return _ServiceCard(
                    data: viewModel.services[index],
                    width: cardWidth,
                    animate: animate,
                    delay: (index * 100).ms,
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "SERVICES",
            style: AppStyles.sectionTag.copyWith(letterSpacing: 4),
          ),
        ),
        SizedBox(height: size.height * 0.016),
        Text(
          "Solutions I Provide",
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceModel data;
  final double width;
  final bool animate;
  final Duration delay;

  const _ServiceCard({
    required this.data, 
    required this.width,
    required this.animate,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomHoverCard(
      highlightColor: data.color,
      animate: animate,
      delay: delay,
      width: width,
      padding: const EdgeInsets.all(32),
      builder: (isHovered) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isHovered ? data.color : data.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              boxShadow: isHovered ? [
                BoxShadow(
                  color: data.color.withValues(alpha: 0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                )
              ] : [],
            ),
            child: Icon(
              data.icon,
              color: isHovered ? Colors.white : data.color,
              size: 24
            ),
          ),
          SizedBox(height: size.height * 0.032),
          Text(
            data.title,
            style: AppStyles.subHeading.copyWith(fontSize: 20, height: 1.2),
          ),
          SizedBox(height: size.height * 0.016),
          Text(
            data.description,
            style: AppStyles.body.copyWith(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.5),
              height: 1.6,
            ),
          ),
          SizedBox(height: size.height * 0.032),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: isHovered ? 40 : 0,
            color: data.color,
          ),
        ],
      ),
    );
  }
}

