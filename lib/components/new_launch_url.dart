import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewRowLaunchScreen extends StatefulWidget {

  final IconData icon;

  const NewRowLaunchScreen({super.key,  required this.icon});

  @override
  State<NewRowLaunchScreen> createState() => _NewRowLaunchScreenState();
}

class _NewRowLaunchScreenState extends State<NewRowLaunchScreen> {
  final url = 'https://github.com/MEhsan1237';

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 20,),
        ElevatedButton(

          onPressed: _launchUrl,
          style: ElevatedButton.styleFrom( backgroundColor: Colors.blue,shape:  CircleBorder()),child: Icon(widget.icon,color: Colors.white,),


        ),
      ],
    );
  }
}




