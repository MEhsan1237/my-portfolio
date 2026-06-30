import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/widgets/contact_me_screen.dart';
import 'package:practice_web/widgets/home_screen.dart';
import 'package:practice_web/widgets/project_screen.dart';
import 'package:practice_web/widgets/qualification_screen.dart';
import 'package:practice_web/widgets/services_screen.dart';
import 'package:practice_web/widgets/methodology_screen.dart';
import 'package:practice_web/widgets/languages_screen.dart';
import 'package:practice_web/widgets/stats_screen.dart';
import 'package:practice_web/widgets/about_me_screen.dart';
import 'package:practice_web/widgets/animated_background.dart';
import 'package:practice_web/widgets/experience_screen.dart';
import 'package:practice_web/widgets/reviews_screen.dart';

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
  final List<GlobalKey> _keys = List.generate(10, (index) => GlobalKey());
  int _activeIndex = 0;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Show/hide back to top button
    if (_scrollController.offset > 500 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 500 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }

    // Update active index based on scroll position
    int closestIndex = 0;
    double viewportHeight = MediaQuery.of(context).size.height;

    for (int i = 0; i < _keys.length; i++) {
      final context = _keys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;
        
        // If the top of the section is in the top 30% of the screen
        // or if the section is currently covering the top of the screen
        if (position <= viewportHeight * 0.3) {
          closestIndex = i;
        }
      }
    }

    if (closestIndex != _activeIndex) {
      setState(() {
        _activeIndex = closestIndex;
      });
    }
  }

  void _onMenuClick(int index) {
    final context = _keys[index].currentContext;
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
                        _navItem("Education", 7),
                        _navItem("Reviews", 8),
                        _navItem("Contact", 9),
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
          // Dynamic Background
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
          ),

          const AnimatedBackground(),
          
          // Floating background elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.1),
              ),
            ),
          ),
          
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HomeScreen(key: _keys[0]),
                AboutMeScreen(key: _keys[1]),
                ExperienceScreen(key: _keys[2]),
                ProjectScreen(key: _keys[3]),
                ServicesScreen(key: _keys[4]),
                MethodologyScreen(key: _keys[5]),
                LanguagesScreen(key: _keys[6]),
                QualificationRequiredWidget(key: _keys[7]),
                ReviewsScreen(key: _keys[8]),
                ContactMeScreen(
                  key: _keys[9],
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
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            "E",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white,
              fontSize: 20,
            )
          ),
        ),
        const SizedBox(width: 12),
        Text(
          "Ehsan",
          style: GoogleFonts.poppins(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
            fontSize: 22,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "EHSAN",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    "PORTFOLIO",
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.8), letterSpacing: 2),
                  ),
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
          _drawerItem("Education", 7, Icons.history_outlined),
          _drawerItem("Reviews", 8, Icons.star_outline),
          _drawerItem("Contact", 9, Icons.mail_outline),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, int index, IconData icon) {
    bool isActive = _activeIndex == index;
    if (index == 5 && (_activeIndex == 5 || _activeIndex == 6)) {
      isActive = true;
    }
    
    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.primary : Colors.white),
      title: Text(
        title, 
        style: TextStyle(
          color: isActive ? AppColors.primary : Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        )
      ),
      onTap: () {
        Navigator.pop(context);
        _onMenuClick(index);
      },
    );
  }

  Widget _navItem(String title, int index) {
    bool isActive = _activeIndex == index;
    if (index == 5 && (_activeIndex == 5 || _activeIndex == 6)) {
      isActive = true;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => _onMenuClick(index),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: isActive ? AppColors.primary : Colors.white,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: isActive ? 20 : 0,
                margin: const EdgeInsets.only(top: 4),
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
