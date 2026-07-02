import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/utils/constants.dart';
import '../models/skill_model.dart';

class SkillsViewModel {
  final String headerTag = "SKILLS & EXPERTISE";
  final String headerTitle = "Technologies I Master";

  final List<SkillModel> devSkills = [
    SkillModel(title: "Flutter & Dart", level: 0.95, icon: FontAwesomeIcons.flutter, color: Colors.blue),
    SkillModel(title: "React.js & Next.js", level: 0.85, icon: FontAwesomeIcons.react, color: Colors.cyan),
    SkillModel(title: "Node.js & Express", level: 0.80, icon: FontAwesomeIcons.nodeJs, color: Colors.green),
    SkillModel(title: "Clean Architecture", level: 0.90, icon: FontAwesomeIcons.code, color: Colors.indigoAccent),
  ];

  final List<SkillModel> toolSkills = [
    SkillModel(title: "Firebase & Supabase", level: 0.90, icon: FontAwesomeIcons.fire, color: Colors.orange),
    SkillModel(title: "MongoDB & SQL", level: 0.85, icon: FontAwesomeIcons.database, color: Colors.greenAccent),
    SkillModel(title: "Git & CI/CD", level: 0.95, icon: FontAwesomeIcons.github, color: Colors.white),
    SkillModel(title: "UI/UX (Figma)", level: 0.75, icon: FontAwesomeIcons.figma, color: Colors.pinkAccent),
  ];

  final List<SkillModel> technicalStack = [
    SkillModel(title: "Dart", icon: FontAwesomeIcons.dartLang, color: AppColors.primary, level: 0.95),
    SkillModel(title: "Node.js", icon: FontAwesomeIcons.nodeJs, color: Colors.green, level: 0.85),
    SkillModel(title: "Postman", icon: FontAwesomeIcons.rocket, color: Colors.orange, level: 0.90),
    SkillModel(title: "JavaScript", icon: FontAwesomeIcons.js, color: Colors.yellow, level: 0.90),
    SkillModel(title: "HTML5", icon: FontAwesomeIcons.html5, color: Colors.orange, level: 0.98),
    SkillModel(title: "CSS3", icon: FontAwesomeIcons.css3Alt, color: Colors.blueAccent, level: 0.95),
    SkillModel(title: "Tailwind", icon: FontAwesomeIcons.wind, color: Colors.cyanAccent, level: 0.90),
    SkillModel(title: "Git", icon: FontAwesomeIcons.github, color: Colors.white, level: 0.95),
  ];
}
