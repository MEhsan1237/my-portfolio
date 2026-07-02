import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/review_model.dart';
import '../view_models/reviews_view_model.dart';

class ReviewsView extends StatefulWidget {
  final bool animate;
  const ReviewsView({super.key, this.animate = false});

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  final ReviewsViewModel viewModel = ReviewsViewModel();
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < viewModel.reviews.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutQuart,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.06,
        bottom: 50,
        left: isMobile ? 0 : size.width * 0.05,
        right: isMobile ? 0 : size.width * 0.05,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: SectionAnimation(
              animate: widget.animate,
              child: _buildHeader(size),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          SectionAnimation(
            animate: widget.animate,
            delay: 200.ms,
            child: SizedBox(
              height: isMobile ? 420 : 400,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: viewModel.reviews.length,
                itemBuilder: (context, index) {
                  return _buildReviewCard(viewModel.reviews[index], index, isMobile, size);
                },
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          _buildPageIndicator(),
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
            "TESTIMONIALS",
            style: GoogleFonts.inter(
              color: AppColors.primary,
              fontSize: 12,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.016),
        Text(
          "What Clients Say",
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

  Widget _buildReviewCard(ReviewModel data, int index, bool isMobile, Size size) {
    double scale = _currentPage == index ? 1.0 : 0.85;
    
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuart,
      child: CustomHoverCard(
        highlightColor: AppColors.primary,
        liftUp: false, // Disables the top-right movement
        padding: EdgeInsets.all(isMobile ? 20 : 40),
        builder: (isHovered) => Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isHovered ? 0.2 : 0.05,
                child: Icon(
                  Icons.format_quote_rounded,
                  size: isMobile ? 60 : 80,
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: isHovered ? 1.02 : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: isMobile ? 70 : 80,
                        height: isMobile ? 70 : 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary, width: 2),
                          image: DecorationImage(
                            image: NetworkImage(data.image),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 15,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          return Icon(
                            i < data.rating ? Icons.star_rounded : Icons.star_half_rounded,
                            color: Colors.amber,
                            size: isMobile ? 18 : 20,
                          );
                        }),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        data.review,
                        textAlign: TextAlign.center,
                        style: AppStyles.body.copyWith(
                          fontSize: isMobile ? 14 : 16,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: size.height * 0.024),
                      Text(
                        data.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data.role,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AppColors.primary,
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(viewModel.reviews.length, (index) {
        bool isActive = _currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            gradient: isActive ? AppColors.primaryGradient : null,
            color: isActive ? null : Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
