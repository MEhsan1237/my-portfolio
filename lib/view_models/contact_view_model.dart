import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/social_model.dart';

class ContactViewModel {
  final String headerTag = "CONTACT ME";
  final String headerTitle = "Let's Build Something Great";
  
  final String contactDescription = "I'm currently available for freelance work and full-time opportunities. Feel free to reach out!";
  final String email = "mehsan4270@gmail.com";
  final String phone = "+92 303 9095463";
  final String location = "Lahore, Punjab, Pakistan";

  final List<SocialModel> socials = [
    SocialModel(icon: FontAwesomeIcons.github, url: "https://github.com/MEhsan1237", color: const Color(0xFF181717)),
    SocialModel(icon: FontAwesomeIcons.linkedinIn, url: "https://www.linkedin.com/in/muhammad-ehsan-41680731b", color: const Color(0xFF0077B5)),
    SocialModel(icon: FontAwesomeIcons.tiktok, url: "https://www.tiktok.com/@mehsan1237", color: const Color(0xFFFE2C55)),
  ];

  final String footerDescription = "A passionate developer focused on building high-end, production-ready applications with Flutter and the MERN stack. Turning complex problems into elegant digital solutions.";
}
