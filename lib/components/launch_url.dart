import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RowLaunchScreen extends StatefulWidget {
  final String url;
  final IconData icon;

  const RowLaunchScreen({super.key, required this.url, required this.icon});

  @override
  State<RowLaunchScreen> createState() => _RowLaunchScreenState();
}

class _RowLaunchScreenState extends State<RowLaunchScreen> {
  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _launchUrl,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.deepPurple.shade700],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "View Project",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(widget.icon, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
