import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewRowLaunchScreen3 extends StatefulWidget {

  final IconData icon;

  const NewRowLaunchScreen3({super.key,  required this.icon});

  @override
  State<NewRowLaunchScreen3> createState() => _NewRowLaunchScreen3State();
}

class _NewRowLaunchScreen3State extends State<NewRowLaunchScreen3> {
  final url3 = 'https://www.linkedin.com/in/muhammad-ehsan-41680731b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app';

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url3);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 20,),
        ElevatedButton(

          onPressed: _launchUrl,child: Icon(widget.icon,color: Colors.white,),
          style: ElevatedButton.styleFrom( backgroundColor: Colors.blue,shape:  CircleBorder()),


        ),
      ],
    );
  }
}




