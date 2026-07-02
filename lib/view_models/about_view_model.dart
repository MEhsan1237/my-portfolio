import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/utils/constants.dart';
import '../models/expertise_model.dart';
import '../models/detail_model.dart';

class AboutViewModel {
  final String headerTag = "ABOUT ME";
  final String headerTitle = "Passionate About Innovation";
  final String mainTitle = "Passionate Full-Stack Developer & UI/UX Designer";
  final String description = "I specialize in building high-end mobile and web applications using Flutter and the MERN stack. My approach combines technical excellence with a deep understanding of user psychology to create digital products that aren't just functional, but delightful to use.";
  final String aboutImage = "assets/images/mine.pic.png";
  final String experienceYears = "3+";

  final List<ExpertiseModel> expertise = [
    ExpertiseModel(title: "High Performance", icon: FontAwesomeIcons.bolt, color: AppColors.primary),
    ExpertiseModel(title: "Responsive Design", icon: FontAwesomeIcons.expand, color: AppColors.accent),
    ExpertiseModel(title: "Clean Architecture", icon: FontAwesomeIcons.code, color: AppColors.secondary),
    ExpertiseModel(title: "Modern Technology", icon: FontAwesomeIcons.microchip, color: Colors.orangeAccent),
  ];

  final List<DetailModel> details = [
    DetailModel(label: "NAME", value: "Muhammad Ehsan", icon: FontAwesomeIcons.user, color: AppColors.primary),
    DetailModel(label: "EMAIL", value: "mehsan4270@gmail.com", icon: FontAwesomeIcons.envelope, color: AppColors.accent),
    DetailModel(label: "LOCATION", value: "Lahore,Punjab,Pk", icon: FontAwesomeIcons.locationDot, color: Colors.orangeAccent),
    DetailModel(label: "AVAILABILITY", value: "Turning Ideas Into Reality", icon: FontAwesomeIcons.briefcase, color: AppColors.secondary),
  ];
}
