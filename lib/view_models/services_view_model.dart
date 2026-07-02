import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/utils/constants.dart';
import '../models/service_model.dart';

class ServicesViewModel {
  final List<ServiceModel> services = [
    ServiceModel(
      title: "Full Stack Development",
      description: "Building robust end-to-end applications with modern frontend and backend technologies.",
      icon: FontAwesomeIcons.layerGroup,
      color: AppColors.primary,
    ),
    ServiceModel(
      title: "REST API Development",
      description: "Designing secure, scalable, and high-performance APIs to power seamless data exchange.",
      icon: FontAwesomeIcons.server,
      color: AppColors.accent,
    ),
    ServiceModel(
      title: "Mobile Development",
      description: "Crafting high-performance, native-quality cross-platform mobile apps using Flutter.",
      icon: FontAwesomeIcons.mobileScreen,
      color: AppColors.secondary,
    ),
    ServiceModel(
      title: "Database Integration",
      description: "Optimizing data storage and retrieval with efficient SQL and NoSQL database architectures.",
      icon: FontAwesomeIcons.database,
      color: Colors.orangeAccent,
    ),
    ServiceModel(
      title: "WebSockets Apps",
      description: "Live chat, notifications, and collaborative features with Socket.io, seamless user interactions.",
      icon: FontAwesomeIcons.shieldHalved,
      color: Colors.greenAccent,
    ),
    ServiceModel(
      title: "UI/UX Designs",
      description: "Creating intuitive, visually stunning, and user-centric interfaces that enhance engagement.",
      icon: FontAwesomeIcons.penNib,
      color: Colors.pinkAccent,
    ),
  ];
}
