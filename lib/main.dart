import 'package:flutter/material.dart';
import 'package:practice_web/widgets/contact_me_screen.dart';
import 'package:practice_web/widgets/home_screen.dart';
import 'package:practice_web/widgets/project_screen.dart';
import 'package:practice_web/widgets/qualification_screen.dart';
import 'package:practice_web/widgets/services_screen.dart';


import 'animation/hover_animation.dart';

void main() {
  final Color primaryColor = Colors.black;
  runApp(

      MaterialApp(
          theme:  ThemeData(
              primaryColor:  primaryColor,
              scaffoldBackgroundColor:  primaryColor,
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
          ),

          debugShowCheckedModeBanner: false, home: MyWebApp()));
}

class MyWebApp extends StatefulWidget {
  const MyWebApp({super.key});

  @override
  State<MyWebApp> createState() => _MyWebAppState();
}

class _MyWebAppState extends State<MyWebApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AboutMeScreen(),
    const ServicesScreen(),
    const  QualificationRequiredWidget(),
    const ContactMeScreen(),

  ];

  void _onMenuClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),

          backgroundColor: Colors.deepPurple.shade400,
          title: Text("Portfolio", style: TextStyle(color: Colors.white)),
          actions: [
            HoveredAnimationScreen(
              onPressed: () => _onMenuClick(0),
              color: Colors.red,
              width: 80,
              height: 25,
              child: Text(
                textAlign: TextAlign.center,
                "profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
            HoveredAnimationScreen(
              onPressed: () => _onMenuClick(1),
              color: Colors.red,
              width: 85,
              height: 25,
              child: Text(
                textAlign: TextAlign.center,
                "Projects",
                style: TextStyle(color: Colors.white),
              ),
            ),
            HoveredAnimationScreen(
              onPressed: () => _onMenuClick(2),
              color: Colors.red,
              width: 80,
              height: 25,
              child: Text(
                textAlign: TextAlign.center,
                "services",
                style: TextStyle(color: Colors.white),
              ),
            ),
            HoveredAnimationScreen(
              onPressed: () => _onMenuClick(3),
              color: Colors.red,
              width: 100,
              height: 25,
              child: Text(
                textAlign: TextAlign.center,
                "Qualifications",
                style: TextStyle(color: Colors.white),
              ),
            ),
            HoveredAnimationScreen(
              onPressed: () => _onMenuClick(4),
              color: Colors.red,
              width: 90,
              height: 25,
              child: Text(
                textAlign: TextAlign.center,
                "Contact me",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 50,),
          ],),
        body: _screens[_selectedIndex],



      );
  }
}

// Example Screens


