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
        Text(
          widget.url,
          style: TextStyle(
            color: Colors.blue,

          ),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Click here",
              style: TextStyle(
                color: Colors.deepPurple.shade400,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            ElevatedButton(onPressed: _launchUrl,
            style: ElevatedButton.styleFrom( backgroundColor: Colors.deepPurple.shade400),child: Icon(widget.icon,color: Colors.white,),)
          ],
        ),
      ],
    );
  }
}
