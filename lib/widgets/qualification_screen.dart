import 'package:flutter/material.dart';

import '../animation/hover_animation.dart';
import '../animation/slide_fade_animation.dart';




class QualificationRequiredWidget extends StatefulWidget {
  const QualificationRequiredWidget({super.key});

  @override
  State<QualificationRequiredWidget> createState() =>
      _QualificationRequiredWidgetState();
}

class _QualificationRequiredWidgetState
    extends State<QualificationRequiredWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: MyCustomWidgetScreen(
        index: 1,
        child: ListView(
            children:[
              SizedBox(height: 10,),
              Center(child: Text("Qualifications",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 4,),
                    HoveredAnimationScreen(
                      onPressed: () {  },
                      color: Colors.red,
                      width: 220,
                      height: 230,
                      child: Center(
                        child: QualificationRequiredWidget1(
                          degreeName: 'Matriculation',
                          instituteName: 'Dawn Science School',
                          startedDate: '2018',
                          endedDate: '2020',
                          totalMarks: '1100',
                          obtainedMarks: '1011', percentage: '92%',
                        ),
                      ),
                    ),
                    SizedBox(width: 40,),
                    HoveredAnimationScreen(
                      onPressed: () {  },
                      color: Colors.red,
                      width: 220,
                      height: 230,
                      child: QualificationRequiredWidget1(
                        degreeName: 'Fsc(Pre-Eng)',
                        instituteName: 'Superior College',
                        startedDate: '2020',
                        endedDate: '2022',
                        totalMarks: '1100',
                        obtainedMarks: '936', percentage: '85%',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  HoveredAnimationScreen(
                    onPressed: () {  },
                    color: Colors.red,
                    width: 220,
                    height: 230,
                    child: Center(
                      child: QualificationRequiredWidget1(
                        degreeName: 'BS(Software Eng)',
                        instituteName: 'Islamia uni of Bwp',
                        startedDate: '2023',
                        endedDate: 'Continued',
                        totalMarks: '4.0',
                        obtainedMarks: '3.86', percentage: '96.5%',
                      ),
                    ),
                  ),
                ],
              )
            ]
        ),
      ),
    );
  }
}

class QualificationRequiredWidget1 extends StatelessWidget {
  final String degreeName;
  final String instituteName;
  final String startedDate;
  final String endedDate;
  final String totalMarks;
  final String obtainedMarks;
  final String percentage;

  const QualificationRequiredWidget1({
    super.key,
    required this.degreeName,
    required this.instituteName,
    required this.startedDate,
    required this.endedDate,
    required this.totalMarks,
    required this.obtainedMarks, required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Text(
          degreeName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text("Institute: $instituteName",style: TextStyle(color: Colors.white),),
        Text("Started Date: $startedDate",style: TextStyle(color: Colors.white),),
        Text("Ended Date: $endedDate",style: TextStyle(color: Colors.white),),
        Text("Total Marks: $totalMarks",style: TextStyle(color: Colors.white),),
        Text("Obtained Marks: $obtainedMarks",style: TextStyle(color: Colors.white),),
        Text("Percentage:      $percentage",style: TextStyle(color: Colors.white),),
      ],
    );
  }
}