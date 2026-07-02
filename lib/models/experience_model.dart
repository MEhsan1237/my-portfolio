import 'package:flutter/material.dart';

class ExperienceModel {
  final String company;
  final String location;
  final String role;
  final String period;
  final IconData icon;
  final Color color;

  ExperienceModel({
    required this.company,
    required this.location,
    required this.role,
    required this.period,
    required this.icon,
    required this.color,
  });
}
