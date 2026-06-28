import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';

class ContactMeScreen extends StatelessWidget {
  final Function(int)? onFooterNav;

  const ContactMeScreen({super.key, this.onFooterNav});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 950;

    return Container(
      padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
      child: Column(
        children: [
          MyCustomWidgetScreen(
            index: 0,
            direction: RevealDirection.top,
            child: Column(
              children: [
                const Text(
                  "CONTACT",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Get In Touch With Me",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          AnimationLimiter(
            child: isSmallScreen
                ? Column(
                    children: [
                      MyCustomWidgetScreen(
                        index: 1,
                        direction: RevealDirection.left,
                        child: _buildContactDetails(size.width * 0.9),
                      ),
                      const SizedBox(height: 30),
                      MyCustomWidgetScreen(
                        index: 2,
                        direction: RevealDirection.right,
                        child: _buildContactForm(size.width * 0.9),
                      ),
                    ],
                  )
                : IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyCustomWidgetScreen(
                          index: 1,
                          direction: RevealDirection.left,
                          child: _buildContactDetails(450),
                        ),
                        const SizedBox(width: 30),
                        MyCustomWidgetScreen(
                          index: 2,
                          direction: RevealDirection.right,
                          child: _buildContactForm(550),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 100),
          _buildModernFooter(context),
        ],
      ),
    );
  }

  Widget _buildContactDetails(double width) {
    return Container(
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Let's Discuss Your Project",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            "I'm always open to discussing new projects, creative ideas or opportunities to be part of your visions.",
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 40),
          _contactItem(FontAwesomeIcons.phone, "Phone 1", "+92 303 9095463"),
          const SizedBox(height: 25),
          _contactItem(FontAwesomeIcons.phone, "Phone 2", "+92 336 1615363"),
          const SizedBox(height: 25),
          _contactItem(FontAwesomeIcons.solidEnvelope, "Email", "mehsan4270@gmail.com"),
          const SizedBox(height: 25),
          _contactItem(FontAwesomeIcons.locationDot, "Address", "Burewala, Punjab, Pakistan"),
          const SizedBox(height: 50),
          const Text(
            "Social Profiles",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.linkedinIn,
                url: 'https://www.linkedin.com/in/muhammad-ehsan-41680731b',
                color: const Color(0xFF0077B5),
              ),
              _SocialIcon(
                icon: FontAwesomeIcons.github,
                url: 'https://github.com/MEhsan1237',
                color: Colors.white,
              ),
              _SocialIcon(
                icon: FontAwesomeIcons.tiktok,
                url: 'https://www.tiktok.com/@mehsan1237',
                color: const Color(0xFFFE2C55),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactForm(double width) {
    return Container(
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Send Me a Message",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          _textField("Your Name", FontAwesomeIcons.user, false),
          const SizedBox(height: 20),
          _textField("Your Email", FontAwesomeIcons.solidEnvelope, false),
          const SizedBox(height: 20),
          _textField("Subject", FontAwesomeIcons.penToSquare, false),
          const SizedBox(height: 20),
          _textField("Your Message", FontAwesomeIcons.message, true, maxLines: 5),
          const SizedBox(height: 40),
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.redAccent,
            width: double.infinity,
            height: 45,
            borderRadius: 12,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.redAccent.shade700],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  "SEND MESSAGE",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textField(String hint, IconData icon, bool isTextArea, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 8),
          child: Text(
            hint,
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
        TextField(
          maxLines: maxLines,
          textAlignVertical: isTextArea ? TextAlignVertical.top : TextAlignVertical.center,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter $hint",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 14),
            prefixIcon: Container(
              padding: EdgeInsets.only(top: isTextArea ? 15 : 0),
              child: Column(
                mainAxisAlignment: isTextArea ? MainAxisAlignment.start : MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(icon, color: Colors.redAccent.withOpacity(0.5), size: 18),
                  ),
                ],
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 48,
              minHeight: isTextArea ? (maxLines * 24.0 + 20) : 48,
            ),
            filled: true,
            fillColor: Colors.black.withOpacity(0.2),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: isTextArea ? 20 : 0, horizontal: 20),
          ),
        ),
      ],
    );
  }

  Widget _contactItem(IconData icon, String label, String val) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.redAccent, size: 20),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12, letterSpacing: 1)),
            Text(val, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }

  Widget _buildModernFooter(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Column(
        children: [
          isMobile 
            ? Column(
                children: [
                  _footerColumn1(),
                  const SizedBox(height: 40),
                  _footerColumn2(),
                  const SizedBox(height: 40),
                  _footerColumn3(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _footerColumn1()),
                  Expanded(child: _footerColumn2()),
                  Expanded(child: _footerColumn3()),
                ],
              ),
          const SizedBox(height: 60),
          Divider(color: Colors.white.withOpacity(0.05)),
          const SizedBox(height: 20),
          Text(
            "© 2024 Muhammad Ehsan. All Rights Reserved.",
            style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _footerColumn1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.tealAccent, borderRadius: BorderRadius.circular(8)),
              child: const Text("E", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            const SizedBox(width: 10),
            const Text("Ehsan Portfolio", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Building high-performance applications with modern technologies. Specialized in Flutter, MERN Stack, and Mobile development.",
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14, height: 1.6),
        ),
      ],
    );
  }

  Widget _footerColumn2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Quick Links", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _footerLink("Home", 0),
        _footerLink("Projects", 1),
        _footerLink("Skills", 2),
        _footerLink("Services", 3),
        _footerLink("Contact", 6),
      ],
    );
  }

  Widget _footerColumn3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("Expertise", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _expertiseText("Flutter Developer"),
        _expertiseText("MERN Stack Developer"),
        _expertiseText("Mobile Application Dev"),
        _expertiseText("Front End Web Dev"),
        _expertiseText("UI/UX Designer"),
      ],
    );
  }

  Widget _footerLink(String title, int index) {
    return InkWell(
      onTap: () => onFooterNav?.call(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
        ),
      ),
    );
  }

  Widget _expertiseText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.tealAccent.withOpacity(0.7), fontSize: 14),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  final Color color;

  const _SocialIcon({required this.icon, required this.url, required this.color});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool isHovered = false;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: _launchUrl,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: isHovered ? widget.color.withOpacity(0.2) : Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered ? widget.color : Colors.white.withOpacity(0.1),
              width: 2,
            ),
            boxShadow: isHovered ? [
              BoxShadow(
                color: widget.color.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ] : [],
          ),
          child: Center(
            child: Icon(
              widget.icon,
              color: isHovered ? widget.color : Colors.white.withOpacity(0.7),
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
