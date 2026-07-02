import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../components/custom_animations.dart';
import '../view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel viewModel = HomeViewModel();
  
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;
    
    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 150,
        left: isMobile ? 20 : size.width * 0.1,
        right: isMobile ? 20 : size.width * 0.1,
        bottom: 50,
      ),
      child: isMobile 
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileImage(size),
              const SizedBox(height: 40),
              _buildTextContent(context, true),
              const SizedBox(height: 50),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 3, child: _buildTextContent(context, false)),
              Expanded(flex: 2, child: _buildProfileImage(size)),
            ],
          ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool centered) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: Text(
            viewModel.greeting,
            style: AppStyles.sectionTag,
          ),
        ).animate().fadeIn(duration: 1000.ms).slideX(begin: -0.2),
        const SizedBox(height: 24),
        _buildAnimatedName(centered).animate().fadeIn(delay: 200.ms, duration: 1000.ms).slideX(begin: -0.2),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "I'm a ",
              style: AppStyles.subHeading.copyWith(fontSize: centered ? 20 : 28),
            ),
            DefaultTextStyle(
              style: AppStyles.subHeading.copyWith(
                fontSize: centered ? 20 : 28,
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
                letterSpacing: 1.2,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 1000),
                animatedTexts: viewModel.titles.map((title) => TypewriterAnimatedText(
                  title,
                  cursor: '|',
                  speed: const Duration(milliseconds: 120),
                )).toList(),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 400.ms, duration: 1000.ms).slideX(begin: -0.2),
        const SizedBox(height: 24),
        Text(
          viewModel.description,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: AppStyles.body.copyWith(fontSize: 18),
        ).animate().fadeIn(delay: 600.ms, duration: 1000.ms).slideX(begin: -0.2),
        const SizedBox(height: 40),
        _buildActionButtons(centered).animate().fadeIn(delay: 800.ms, duration: 1000.ms).slideY(begin: 0.2),
      ],
    );
  }

  Widget _buildAnimatedName(bool centered) {
    return Wrap(
      alignment: centered ? WrapAlignment.center : WrapAlignment.start,
      children: viewModel.name.split('').map((char) {
        if (char == ' ') {
          return SizedBox(width: centered ? 10 : 15);
        }
        return HoverItem(
          builder: (isHovered) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform: isHovered ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
            child: GradientText(
              char,
              style: AppStyles.heroName.copyWith(
                fontSize: centered ? 34 : 54,
              ),
              colors: isHovered 
                ? [const Color(0xFF1E1B4B), const Color(0xFF312E81)]
                : const [
                    AppColors.primary,
                    AppColors.secondary,
                    AppColors.accent,
                  ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons(bool centered) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: centered ? WrapAlignment.center : WrapAlignment.start,
      children: [
        _buildButton("Download CV", Icons.download, true),
      ],
    );
  }

  Widget _buildButton(String label, IconData icon, bool primary) {
    return HoverItem(
      builder: (isHovered) => Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: isHovered 
            ? LinearGradient(
                colors: [AppColors.accent, AppColors.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: isHovered ? 0.5 : 0.3),
              blurRadius: isHovered ? 20 : 15,
              offset: Offset(0, isHovered ? 10 : 6),
            )
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 10),
              Text(
                label,
                style: AppStyles.navItem.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ),
      ).animate(target: isHovered ? 1 : 0)
       .moveY(end: -8, duration: 300.ms, curve: Curves.easeOut)
       .animate(onPlay: (c) => c.repeat())
       .shimmer(delay: 2.seconds, duration: 1500.ms, color: Colors.white24),
    );
  }

  Widget _buildProfileImage(Size size) {
    double imgSize = size.width < 600 ? 280 : 400;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: imgSize * 0.8,
          height: imgSize * 0.8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 100,
                spreadRadius: 20,
              ),
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: 0.2),
                blurRadius: 100,
                spreadRadius: 20,
              ),
            ],
          ),
        ).animate(onPlay: (c) => c.repeat()).rotate(duration: 10.seconds),
        
        Container(
          width: imgSize,
          height: imgSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 30,
                offset: const Offset(0, 20),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imgSize),
            child: Image.asset(
              viewModel.profileImage,
              fit: BoxFit.cover,
            ),
          ),
        ).animate(onPlay: (c) => c.repeat(reverse: true))
         .moveY(begin: -15, end: 15, duration: 3.seconds, curve: Curves.easeInOut),
      ],
    ).animate().fadeIn(duration: 1.seconds).scale(begin: const Offset(0.8, 0.8));
  }
}
