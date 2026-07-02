import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/utils/constants.dart';
import '../models/experience_model.dart';

class ExperienceViewModel {
  final String headerTag = "JOURNEY";
  final String headerTitle = "Professional Path";

  final List<ExperienceModel> experiences = [
    ExperienceModel(
      company: "DevelopersHub Corp",
      location: "India (Remote)",
      role: "Flutter Developer Intern",
      period: "May 2024 - June 2024",
      icon: FontAwesomeIcons.laptopCode,
      color: Colors.tealAccent,
    ),
    ExperienceModel(
      company: "Future Dev Solution",
      location: "Lahore (Onsite)",
      role: "Junior Web Developer",
      period: "2025 - 2026",
      icon: FontAwesomeIcons.code,
      color: AppColors.accent,
    ),
    ExperienceModel(
      company: "Excelerate Talent Dis",
      location: "Dubai (Remote)",
      role: "Flutter Development Intern",
      period: "June 2025 - July 2025",
      icon: FontAwesomeIcons.mobileScreen,
      color: AppColors.primary,
    ),
    ExperienceModel(
      company: "Apexify Technologies",
      location: "India (Remote)",
      role: "Flutter Developer Intern",
      period: "March 2026 - April 2026",
      icon: FontAwesomeIcons.flutter,
      color: Colors.orangeAccent,
    ),
    ExperienceModel(
      company: "CodeAlpha",
      location: "Bahawalpur (Remote)",
      role: "Full Stack Web Intern",
      period: "May 2026 - June 2026",
      icon: FontAwesomeIcons.layerGroup,
      color: AppColors.secondary,
    ),
  ];
}
