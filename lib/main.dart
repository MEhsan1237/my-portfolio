import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:practice_web/widgets/contact_me_screen.dart';
import 'package:practice_web/widgets/home_screen.dart';
import 'package:practice_web/widgets/project_screen.dart';
import 'package:practice_web/widgets/qualification_screen.dart';
import 'package:practice_web/widgets/services_screen.dart';
import 'package:practice_web/widgets/methodology_screen.dart';
import 'package:practice_web/widgets/languages_screen.dart';
import 'package:practice_web/widgets/stats_screen.dart';
import 'animation/hover_animation.dart';

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
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: const Color(0xFF0F0F1A), 
        fontFamily: 'Poppins',
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
  final List<GlobalKey> _keys = List.generate(7, (index) => GlobalKey());

  void _onMenuClick(int index) {
    final context = _keys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic,
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
        preferredSize: const Size.fromHeight(70),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.black.withOpacity(0.5),
              elevation: 0,
              centerTitle: isMobile,
              title: Padding(
                padding: EdgeInsets.only(left: isMobile ? 0 : 40.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("E", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Ehsan",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              actions: isMobile 
                ? null 
                : [
                    _navItem("Home", 0),
                    _navItem("Projects", 1),
                    _navItem("Skills", 2),
                    _navItem("Services", 3),
                    _navItem("Languages", 4),
                    _navItem("Experience", 5),
                    _navItem("Contact", 6),
                    const SizedBox(width: 50),
                  ],
            ),
          ),
        ),
      ),
      drawer: isMobile ? _buildDrawer() : null,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurpleAccent.withOpacity(0.05),
              ),
            ),
          ),
          
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HomeScreen(key: _keys[0]),
                const StatsScreen(), // New Stats Section inserted here
                AboutMeScreen(key: _keys[1]),
                MethodologyScreen(key: _keys[2]),
                ServicesScreen(key: _keys[3]),
                LanguagesScreen(key: _keys[4]),
                QualificationRequiredWidget(key: _keys[5]),
                ContactMeScreen(
                  key: _keys[6],
                  onFooterNav: (index) => _onMenuClick(index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0F0F1A),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text("EHSAN PORTFOLIO", style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold)),
            ),
          ),
          _drawerItem("Home", 0),
          _drawerItem("Projects", 1),
          _drawerItem("Skills", 2),
          _drawerItem("Services", 3),
          _drawerItem("Languages", 4),
          _drawerItem("Experience", 5),
          _drawerItem("Contact", 6),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, int index) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        _onMenuClick(index);
      },
    );
  }

  Widget _navItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: HoveredAnimationScreen(
        onPressed: () => _onMenuClick(index),
        color: Colors.deepPurpleAccent.withOpacity(0.4),
        width: 100,
        height: 40,
        borderRadius: 8,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
