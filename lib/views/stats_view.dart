import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/stat_model.dart';
import 'package:practice_web/view_models/stats_view_model.dart';

class StatsView extends StatelessWidget {
  final bool animate;
  final StatsViewModel viewModel = StatsViewModel();
  
  StatsView({super.key, this.animate = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return isMobile
        ? Column(
            children: List.generate(viewModel.stats.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index == viewModel.stats.length - 1 ? 0 : size.height * 0.015),
                child: _buildPremiumStatCard(viewModel.stats[index], index, true, size),
              );
            }),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: viewModel.stats.asMap().entries.map((entry) {
              int index = entry.key;
              StatModel stat = entry.value;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index == viewModel.stats.length - 1 ? 0 : size.width * 0.015),
                  child: _buildPremiumStatCard(stat, index, false, size),
                ),
              );
            }).toList(),
          );
  }

  Widget _buildPremiumStatCard(StatModel data, int index, bool isMobile, Size size) {
    return CustomHoverCard(
      highlightColor: data.color,
      animate: animate,
      delay: (index * 150).ms,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 24 : 32, horizontal: 16),
      builder: (isHovered) => Column(
        mainAxisSize: MainAxisSize.min,
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
              size: 24,
            ),
          ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.1, 1.1)),
          SizedBox(height: size.height * 0.02),
          Animate(
            target: animate ? 1 : 0,
            effects: [
              CustomEffect(
                duration: 2000.ms,
                curve: Curves.easeOutQuart,
                builder: (context, value, child) {
                  final int number = int.tryParse(data.value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
                  final int current = (value * number).toInt();
                  final String suffix = data.value.replaceAll(RegExp(r'[0-9]'), '');
                  return Text(
                    "$current$suffix",
                    style: GoogleFonts.poppins(
                      color: data.color,
                      fontSize: isMobile ? 32 : 36,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                      height: 1,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            data.label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

