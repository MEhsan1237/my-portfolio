import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewRowLaunchScreen2 extends StatefulWidget {

  final IconData icon;

  const NewRowLaunchScreen2({super.key,  required this.icon});

  @override
  State<NewRowLaunchScreen2> createState() => _NewRowLaunchScreen2State();
}

class _NewRowLaunchScreen2State extends State<NewRowLaunchScreen2> {
  final url2 = 'https://www.tiktok.com/@mehsan1237';

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url2);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url2');
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




