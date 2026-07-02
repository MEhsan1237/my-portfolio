import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view_models/contact_view_model.dart';

class ContactMeView extends StatelessWidget {
  final bool animate;
  final Function(int)? onFooterNav;
  final ContactViewModel viewModel = ContactViewModel();

  ContactMeView({super.key, this.onFooterNav, this.animate = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.06,
        left: isMobile ? 20 : size.width * 0.1,
        right: isMobile ? 20 : size.width * 0.1,
        bottom: size.height * 0.05,
      ),
      child: Column(
        children: [
          _buildHeader(size),
          SizedBox(height: size.height * 0.06),
          isMobile
              ? Column(
                  children: [
                    _buildContactInfo(size),
                    SizedBox(height: size.height * 0.04),
                    _buildContactForm(size),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildContactInfo(size)),
                    const SizedBox(width: 60),
                    Expanded(flex: 3, child: _buildContactForm(size)),
                  ],
                ),
          SizedBox(height: size.height * 0.1),
          _buildEliteFooter(context, isMobile, size),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Text(
          viewModel.headerTag,
          style: AppStyles.sectionTag.copyWith(letterSpacing: 4, fontSize: 14),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          viewModel.headerTitle,
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ).animate(target: animate ? 1 : 0).fadeIn(duration: 1000.ms).slideY(begin: 0.2, duration: 1000.ms);
  }

  Widget _buildContactInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: AppStyles.subHeading,
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          viewModel.contactDescription,
          style: AppStyles.body,
        ),
        SizedBox(height: size.height * 0.04),
        _contactItem(Icons.email_outlined, "Email", viewModel.email, size),
        SizedBox(height: size.height * 0.02),
        _contactItem(Icons.phone_outlined, "Phone", viewModel.phone, size),
        SizedBox(height: size.height * 0.02),
        _contactItem(Icons.location_on_outlined, "Location", viewModel.location, size),
        SizedBox(height: size.height * 0.04),
        Row(
          children: viewModel.socials.map((social) => Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _socialButton(social.icon, social.url, social.color),
          )).toList(),
        ),
      ],
    ).animate(target: animate ? 1 : 0).fadeIn(delay: 200.ms, duration: 1000.ms).slideX(begin: -0.1, duration: 1000.ms);
  }

  Widget _contactItem(IconData icon, String label, String value, Size size) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppStyles.body.copyWith(fontSize: 12)),
            Text(value, style: AppStyles.contactLabel),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String url, Color brandColor) {
    return HoverItem(
      builder: (isHovered) => GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isHovered ? brandColor : AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered ? brandColor : Colors.white.withValues(alpha: 0.05),
            ),
            boxShadow: isHovered ? [
              BoxShadow(
                color: brandColor.withValues(alpha: 0.3),
                blurRadius: 15,
                spreadRadius: 2,
              )
            ] : [],
          ),
          child: Icon(
            icon, 
            color: Colors.white, 
            size: 20,
          ),
        ),
      ).animate(target: isHovered ? 1 : 0)
       .scale(end: const Offset(1.15, 1.15))
       .moveY(end: -5, duration: 300.ms),
    );
  }

  Widget _buildContactForm(Size size) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          _textField("Name", size),
          SizedBox(height: size.height * 0.02),
          _textField("Email", size),
          SizedBox(height: size.height * 0.02),
          _textField("Message", size, maxLines: 5),
          SizedBox(height: size.height * 0.03),
          _submitButton(),
        ],
      ),
    ).animate(target: animate ? 1 : 0).fadeIn(delay: 400.ms, duration: 1000.ms).slideX(begin: 0.1, duration: 1000.ms);
  }

  Widget _textField(String label, Size size, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        filled: true,
        fillColor: AppColors.background.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return HoverItem(
      builder: (isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          gradient: isHovered 
            ? AppColors.primaryGradient 
            : LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.3),
                  AppColors.secondary.withValues(alpha: 0.3),
                ],
              ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: isHovered ? 0.4 : 0.1),
              blurRadius: isHovered ? 20 : 10,
              offset: isHovered ? const Offset(0, 8) : const Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            "Send Message",
            style: AppStyles.navItem.copyWith(
              color: isHovered ? Colors.white : Colors.white.withValues(alpha: 0.7),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.02, 1.02)),
    );
  }

  Widget _buildEliteFooter(BuildContext context, bool isMobile, Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.08),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Column(
        children: [
          isMobile 
            ? Column(
                children: [
                  _footerBrandSection(size),
                  SizedBox(height: size.height * 0.05),
                  _footerLinksGrid(isMobile, size),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _footerBrandSection(size)),
                  const SizedBox(width: 80),
                  Expanded(flex: 3, child: _footerLinksGrid(isMobile, size)),
                ],
              ),
          SizedBox(height: size.height * 0.08),
          _footerBottomBar(size),
        ],
      ),
    );
  }

  Widget _footerBrandSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("E", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(width: 15),
            Text(
              "EHSAN PORTFOLIO",
              style: AppStyles.logo.copyWith(fontSize: 20, letterSpacing: 1.5),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.024),
        Text(
          viewModel.footerDescription,
          style: AppStyles.body.copyWith(fontSize: 14, height: 1.8),
        ),
      ],
    );
  }

  Widget _footerLinksGrid(bool isMobile, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _footerLinkColumn("PAGES", [
          _footerLink("Home", 0),
          _footerLink("About", 1),
          _footerLink("Journey", 2),
          _footerLink("Projects", 3),
          _footerLink("Skills", 5),
          _footerLink("Education", 7),
          _footerLink("Reviews", 8),
          _footerLink("Contact", 9),
        ], size),
        _footerLinkColumn("TECH STACK", [
          _footerLink("Flutter & Dart", 5),
          _footerLink("MERN Stack", 4),
          _footerLink("REST APIs", 4),
          _footerLink("Firebase & SQL", 5),
          _footerLink("UI/UX Design", 4),
        ], size),
        if (!isMobile) _footerLinkColumn("LATEST PROJECTS", [
          _footerText("News Insight Pro"),
          _footerText("LifeLine Blood"),
          _footerText("UrbanStore"),
          _footerText("SwiftTask"),
        ], size),
      ],
    );
  }

  Widget _footerLinkColumn(String title, List<Widget> children, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.footerTitle,
        ),
        SizedBox(height: size.height * 0.024),
        ...children,
      ],
    );
  }

  Widget _footerLink(String label, int index) {
    return HoverItem(
      builder: (isHovered) => GestureDetector(
        onTap: () => onFooterNav?.call(index),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            label,
            style: AppStyles.navItem.copyWith(
              color: isHovered ? AppColors.accent : Colors.white.withValues(alpha: 0.5),
              fontSize: 14,
              fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerText(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: AppStyles.body.copyWith(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _footerBottomBar(Size size) {
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.04),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "© 2026 Ehsan Portfolio. All rights reserved.",
            style: AppStyles.body.copyWith(color: Colors.white.withValues(alpha: 0.3), fontSize: 13),
          ),
          Row(
            children: [
              Text(
                "Designed with ",
                style: AppStyles.body.copyWith(color: Colors.white.withValues(alpha: 0.3), fontSize: 13),
              ),
              const Icon(Icons.favorite, color: Colors.red, size: 14),
              Text(
                " by Ehsan",
                style: AppStyles.body.copyWith(color: Colors.white.withValues(alpha: 0.3), fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
