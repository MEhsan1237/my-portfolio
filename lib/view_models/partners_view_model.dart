import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/partner_model.dart';

class PartnersViewModel {
  final List<PartnerModel> partners = [
    PartnerModel(name: "Envato", icon: FontAwesomeIcons.leaf, color: const Color(0xFF82B440)),
    PartnerModel(name: "Magento", icon: FontAwesomeIcons.magento, color: const Color(0xFFF46F25)),
    PartnerModel(name: "Pingdom", icon: FontAwesomeIcons.signal, color: const Color(0xFFFFF100)),
    PartnerModel(name: "Dribbble", icon: FontAwesomeIcons.dribbble, color: const Color(0xFFEA4C89)),
    PartnerModel(name: "Github", icon: FontAwesomeIcons.github, color: Colors.white),
    PartnerModel(name: "StackOverflow", icon: FontAwesomeIcons.stackOverflow, color: const Color(0xFFF48024)),
  ];
}
