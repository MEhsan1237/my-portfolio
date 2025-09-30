import 'package:flutter/material.dart';

import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';
import '../components/launch_url.dart';

class Row2ProjectScreen extends StatelessWidget {
  const Row2ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomWidgetScreen(
      index: 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.red,
            width: 300,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/doctoe.one.png",
                      width: 280,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Doctor Consultant\nApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  "Our Doctor Consultant App makes healthcare accessible and convenient by connecting patients with doctors anytime, anywhere. Users can book appointments, consult through chat or video calls, and receive prescriptions online.",
                ),
                SizedBox(height: 10,),
                RowLaunchScreen(url: 'https://github.com/MEhsan1237/doctor-UI', icon: Icons.arrow_forward,),
              ],
            ),
          ),
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.red,
            width: 300,
            height: 450,
            child: Container(


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/calender.one.png",
                        width: 280,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    " Age Calculator\nApp",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    style: TextStyle(color:Colors.white),
                    textAlign: TextAlign.center,
                    "An Age Calculator App helps users quickly calculate their exact age in years, months, and days. It allows you to select your date of birth and instantly shows your current age. The app is simple, accurate, and useful for daily life or official purposes.",
                  ),
                  SizedBox(height: 10,),
                  RowLaunchScreen(url: 'https://github.com/MEhsan1237/Date-Calculator-App', icon:Icons.arrow_forward,),

                ],
              ),
            ),
          ),
          HoveredAnimationScreen(
            onPressed: () {},
            color: Colors.red,
            width: 300,
            height: 450,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/virus.two.png",
                        width: 300,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Virus App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    "A COVID-19 Tracker App helps users stay updated with the latest coronavirus cases worldwide and locally. It provides real-time statistics such as confirmed cases, recoveries, and deaths. The app also includes safety guidelines, prevention tips, and updates to keep users informed and protected.",
                  ),
                  SizedBox(height: 10,),
                  RowLaunchScreen(url: 'https://github.com/MEhsan1237/covid_app', icon:Icons.arrow_forward,),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
