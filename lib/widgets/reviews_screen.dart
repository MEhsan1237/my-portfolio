import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';

class ReviewData {
  final String name;
  final String role;
  final String review;
  final String image;
  final double rating;

  ReviewData({
    required this.name,
    required this.role,
    required this.review,
    required this.image,
    required this.rating,
  });
}

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<ReviewData> reviews = [
    ReviewData(
      name: "Alex Thompson",
      role: "CEO at TechFlow",
      review: "Ehsan is an exceptional developer. He transformed our complex requirements into a seamless, high-performance Flutter application. His attention to detail and UI/UX expertise is truly world-class.",
      image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop",
      rating: 5.0,
    ),
    ReviewData(
      name: "Sarah Jenkins",
      role: "Product Manager",
      review: "Working with Ehsan was a game-changer for our startup. He didn't just code; he provided valuable insights that improved our product's user flow significantly.",
      image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop",
      rating: 5.0,
    ),
    ReviewData(
      name: "David Chen",
      role: "Founder of GlobalPay",
      review: "The level of professionalism and technical mastery Ehsan brings to the table is rare. He delivered our fintech solution ahead of schedule with zero compromises on security or performance.",
      image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&h=200&fit=crop",
      rating: 5.0,
    ),
    ReviewData(
      name: "Emily Rodriguez",
      role: "Creative Director",
      review: "Ehsan has a unique ability to bridge the gap between design and development. The animations and transitions he implemented in our app are incredibly smooth and visually stunning.",
      image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop",
      rating: 4.9,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < reviews.length - 1) {
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
            child: _buildHeader(size),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            height: isMobile ? 420 : 400,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return _buildReviewCard(reviews[index], index, isMobile, size);
              },
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
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildReviewCard(ReviewData data, int index, bool isMobile, Size size) {
    double scale = _currentPage == index ? 1.0 : 0.85;
    
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuart,
      child: HoverItem(
        builder: (isHovered) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(
            horizontal: isMobile ? 5 : 10, 
            vertical: isMobile ? 10 : 20
          ),
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isHovered ? AppColors.primary.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered 
                    ? AppColors.primary.withValues(alpha: 0.2) 
                    : Colors.black.withValues(alpha: 0.3),
                blurRadius: isHovered ? 40 : 20,
                offset: Offset(0, isHovered ? 20 : 10),
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  Icons.format_quote_rounded,
                  size: isMobile ? 60 : 80,
                  color: AppColors.primary.withValues(alpha: 0.05),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(reviews.length, (index) {
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
