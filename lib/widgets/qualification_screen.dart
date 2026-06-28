import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20),
      child: Column(
        children: [
          MyCustomWidgetScreen(
            index: 0,
            direction: RevealDirection.top,
            child: Column(
              children: [
                Text(
                  "MY JOURNEY",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Education & Qualifications",
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
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              MyCustomWidgetScreen(
                index: 1,
                direction: RevealDirection.bottom,
                child: _buildQualificationCard(
                  degree: 'BS (Software Engineering)',
                  institute: 'The Islamia University of Bahawalpur',
                  period: '2023 - Present',
                  marks: '3.86 CGPA',
                  status: 'Continuing',
                  icon: FontAwesomeIcons.graduationCap,
                ),
              ),
              MyCustomWidgetScreen(
                index: 2,
                direction: RevealDirection.top,
                child: _buildQualificationCard(
                  degree: 'Fsc (Pre-Engineering)',
                  institute: 'Superior Group of Colleges',
                  period: '2020 - 2022',
                  marks: '936 / 1100',
                  status: 'Completed',
                  icon: FontAwesomeIcons.userGraduate,
                ),
              ),
              MyCustomWidgetScreen(
                index: 3,
                direction: RevealDirection.bottom,
                child: _buildQualificationCard(
                  degree: 'Matriculation',
                  institute: 'Dawn Science School',
                  period: '2018 - 2020',
                  marks: '1011 / 1100',
                  status: 'Completed',
                  icon: FontAwesomeIcons.school,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQualificationCard({
    required String degree,
    required String institute,
    required String period,
    required String marks,
    required String status,
    required IconData icon,
  }) {
    return HoveredAnimationScreen(
      onPressed: () {},
      color: Colors.white.withOpacity(0.05),
      width: 350,
      height: 320,
      child: Container(
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: Colors.tealAccent, size: 30),
                Text(
                  period,
                  style: const TextStyle(color: Colors.tealAccent, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              degree,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              institute,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const Spacer(),
            Divider(color: Colors.white.withOpacity(0.1)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoLabel("Performance", marks),
                _infoLabel("Status", status),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoLabel(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 11, letterSpacing: 1),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
