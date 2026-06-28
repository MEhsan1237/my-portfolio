import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeScreen extends StatelessWidget {
  final Function(int)? onFooterNav;

  const ContactMeScreen({super.key, this.onFooterNav});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.only(
        top: 100,
        left: isMobile ? 20 : size.width * 0.1,
        right: isMobile ? 20 : size.width * 0.1,
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _buildContactInfo(),
                    const SizedBox(height: 40),
                    _buildContactForm(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildContactInfo()),
                    const SizedBox(width: 60),
                    Expanded(flex: 3, child: _buildContactForm()),
                  ],
                ),
          const SizedBox(height: 100),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "CONTACT ME",
          style: GoogleFonts.inter(
            color: AppColors.primary,
            fontSize: 14,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Let's Build Something Great",
          textAlign: TextAlign.center,
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 20),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'm currently available for freelance work and full-time opportunities. Feel free to reach out!",
          style: AppStyles.body,
        ),
        const SizedBox(height: 40),
        _contactItem(Icons.email_outlined, "Email", "mehsan4270@gmail.com"),
        const SizedBox(height: 20),
        _contactItem(Icons.phone_outlined, "Phone", "+92 303 9095463"),
        const SizedBox(height: 20),
        _contactItem(Icons.location_on_outlined, "Location", "Burewala, Punjab, Pakistan"),
        const SizedBox(height: 40),
        Row(
          children: [
            _socialButton(
              FontAwesomeIcons.github, 
              "https://github.com/MEhsan1237",
              const Color(0xFF181717),
            ),
            const SizedBox(width: 16),
            _socialButton(
              FontAwesomeIcons.linkedinIn, 
              "https://www.linkedin.com/in/muhammad-ehsan-41680731b",
              const Color(0xFF0077B5),
            ),
            const SizedBox(width: 16),
            _socialButton(
              FontAwesomeIcons.tiktok, 
              "https://www.tiktok.com/@mehsan1237",
              const Color(0xFFFE2C55),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
  }

  Widget _contactItem(IconData icon, String label, String value) {
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
            Text(value, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
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

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          _textField("Name", Icons.person_outline),
          const SizedBox(height: 20),
          _textField("Email", Icons.email_outlined),
          const SizedBox(height: 20),
          _textField("Message", Icons.message_outlined, maxLines: 5),
          const SizedBox(height: 30),
          _submitButton(),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1);
  }

  Widget _textField(String label, IconData icon, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
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
      builder: (isHovered) => Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Center(
          child: Text(
            "Send Message",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.02, 1.02)),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "© 2026 Ehsan Portfolio. Made with ",
                style: AppStyles.body.copyWith(fontSize: 14),
              ),
              const Icon(Icons.favorite, color: Colors.red, size: 16),
              Text(
                " using Flutter",
                style: AppStyles.body.copyWith(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink("Home", 0),
              _footerLink("Projects", 2),
              _footerLink("Skills", 4),
              _footerLink("Contact", 6),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String label, int index) {
    return TextButton(
      onPressed: () => onFooterNav?.call(index),
      child: Text(
        label,
        style: GoogleFonts.inter(color: Colors.white.withValues(alpha: 0.5), fontSize: 13),
      ),
    );
  }
}
