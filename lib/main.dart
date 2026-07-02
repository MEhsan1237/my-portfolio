import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/views/home_view.dart';
import 'package:practice_web/views/about_me_view.dart';
import 'package:practice_web/views/experience_view.dart';
import 'package:practice_web/views/projects_view.dart';
import 'package:practice_web/views/services_view.dart';
import 'package:practice_web/views/methodology_view.dart';
import 'package:practice_web/views/languages_view.dart';
import 'package:practice_web/views/qualification_view.dart';
import 'package:practice_web/views/reviews_view.dart';
import 'package:practice_web/views/partners_view.dart';
import 'package:practice_web/views/contact_me_view.dart';
import 'package:practice_web/animation/animated_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ehsan Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MyWebApp(),
    );
  }
}

class MyWebApp extends StatefulWidget {
  const MyWebApp({super.key});

  @override
  State<MyWebApp> createState() => _MyWebAppState();
}

class _MyWebAppState extends State<MyWebApp> {
  final ScrollController _scrollController = ScrollController();
  
  // Increase keys to track sub-sections independently
  final List<GlobalKey> _keys = List.generate(15, (index) => GlobalKey());
  final List<bool> _animatedSections = List.filled(15, false);
  
  int _activeIndex = 0;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _animatedSections[0] = true; // Home is visible by default
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 500 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 500 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }

    double viewportHeight = MediaQuery.of(context).size.height;
    int closestIndex = 0;

    for (int i = 0; i < _keys.length; i++) {
      final context = _keys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;
        
        // Trigger animation when the top of the element enters the bottom 20% of the screen
        if (position <= viewportHeight * 0.8 && !_animatedSections[i]) {
          setState(() {
            _animatedSections[i] = true;
          });
        }

        // Section Highlight Logic
        if (position <= viewportHeight * 0.3) {
          closestIndex = i;
        }
      }
    }

    // Map internal indices back to navigation indices
    int navIndex = _getNavIndex(closestIndex);
    if (navIndex != _activeIndex) {
      setState(() {
        _activeIndex = navIndex;
      });
    }
  }

  int _getNavIndex(int internalIndex) {
    if (internalIndex <= 0) return 0; // Home
    if (internalIndex <= 2) return 1; // About
    if (internalIndex == 3) return 2; // Journey
    if (internalIndex <= 6) return 3; // Projects
    if (internalIndex == 7) return 4; // Services
    if (internalIndex <= 10) return 5; // Skills
    if (internalIndex == 11) return 6; // Education
    if (internalIndex == 12) return 7; // Reviews
    return 8; // Contact
  }

  void _onMenuClick(int navIndex) {
    int internalIndex = 0;
    switch (navIndex) {
      case 0: internalIndex = 0; break;
      case 1: internalIndex = 1; break;
      case 2: internalIndex = 3; break;
      case 3: internalIndex = 4; break;
      case 4: internalIndex = 7; break;
      case 5: internalIndex = 8; break;
      case 6: internalIndex = 11; break;
      case 7: internalIndex = 12; break;
      case 8: internalIndex = 13; break;
    }

    final context = _keys[internalIndex].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                ),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: false,
                  title: _buildLogo(),
                  actions: isMobile 
                    ? null 
                    : [
                        _navItem("Home", 0),
                        _navItem("About", 1),
                        _navItem("Journey", 2),
                        _navItem("Projects", 3),
                        _navItem("Services", 4),
                        _navItem("Skills", 5),
                        _navItem("Education", 6),
                        _navItem("Reviews", 7),
                        _navItem("Contact", 8),
                        const SizedBox(width: 20),
                      ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: isMobile ? _buildDrawer() : null,
      floatingActionButton: _showBackToTop 
        ? FloatingActionButton(
            mini: true,
            onPressed: () => _onMenuClick(0),
            backgroundColor: AppColors.surface,
            child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
          )
        : null,
      body: Stack(
        children: [
          Container(decoration: const BoxDecoration(gradient: AppColors.backgroundGradient)),
          const AnimatedBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HomeView(key: _keys[0]),
                
                // About Section with Stats tracked separately
                AboutMeView(
                  key: _keys[1], 
                  animate: _animatedSections[1],
                  statsKey: _keys[2],
                  animateStats: _animatedSections[2],
                ),
                
                ExperienceView(key: _keys[3], animate: _animatedSections[3]),
                
                // Projects Section with rows tracked separately
                ProjectsView(
                  key: _keys[4], 
                  animateRow1: _animatedSections[4],
                  row2Key: _keys[5],
                  animateRow2: _animatedSections[5],
                  row3Key: _keys[6],
                  animateRow3: _animatedSections[6],
                ),
                
                ServicesView(key: _keys[7], animate: _animatedSections[7]),
                
                // Methodology Section with Core and Tools tracked separately
                MethodologyView(
                  key: _keys[8], 
                  animateCore: _animatedSections[8],
                  toolsKey: _keys[9],
                  animateTools: _animatedSections[9],
                ),

                LanguagesView(key: _keys[10], animate: _animatedSections[10]),
                QualificationView(key: _keys[11], animate: _animatedSections[11]),
                ReviewsView(key: _keys[12], animate: _animatedSections[12]),
                PartnersView(key: _keys[14], animate: _animatedSections[14]),
                ContactMeView(
                  key: _keys[13],
                  animate: _animatedSections[13],
                  onFooterNav: (index) => _onMenuClick(index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: const Text("E", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
        ),
        const SizedBox(width: 12),
        Text("Ehsan", style: AppStyles.logo),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("EHSAN", style: AppStyles.logo.copyWith(fontSize: 24)),
                  Text("PORTFOLIO", style: TextStyle(color: Colors.white.withValues(alpha: 0.8), letterSpacing: 2)),
                ],
              ),
            ),
          ),
          _drawerItem("Home", 0, Icons.home_outlined),
          _drawerItem("About", 1, Icons.person_outline),
          _drawerItem("Journey", 2, Icons.trending_up),
          _drawerItem("Projects", 3, Icons.work_outline),
          _drawerItem("Services", 4, Icons.bolt_outlined),
          _drawerItem("Skills", 5, Icons.code_outlined),
          _drawerItem("Education", 6, Icons.history_outlined),
          _drawerItem("Reviews", 7, Icons.star_outline),
          _drawerItem("Contact", 8, Icons.mail_outline),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, int index, IconData icon) {
    bool isActive = _activeIndex == index;
    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.primary : Colors.white),
      title: Text(title, style: TextStyle(color: isActive ? AppColors.primary : Colors.white, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      onTap: () {
        Navigator.pop(context);
        _onMenuClick(index);
      },
    );
  }

  Widget _navItem(String title, int index) {
    bool isActive = _activeIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => _onMenuClick(index),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(color: isActive ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: AppStyles.navItem.copyWith(color: isActive ? AppColors.primary : Colors.white, fontWeight: isActive ? FontWeight.bold : FontWeight.w500)),
              AnimatedContainer(duration: const Duration(milliseconds: 300), height: 2, width: isActive ? 20 : 0, margin: const EdgeInsets.only(top: 4), color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
