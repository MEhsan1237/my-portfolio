import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/utils/constants.dart';
import '../models/education_model.dart';

class EducationViewModel {
  final String headerTag = "MY JOURNEY";
  final String headerTitle = "Education & Background";

  final List<EducationModel> education = [
    EducationModel(
      period: "2023 - Present",
      title: "BS Software Engineering",
      subtitle: "The Islamia University of Bahawalpur",
      description: "Specializing in software architecture and mobile development. Maintaining a 3.86 CGPA with focus on scalable applications.",
      icon: FontAwesomeIcons.graduationCap,
      color: AppColors.primary,
    ),
    EducationModel(
      period: "2020 - 2022",
      title: "Fsc Pre-Engineering",
      subtitle: "Superior Group of Colleges",
      description: "Completed higher secondary education with major focus on Mathematics and Physics, securing 936/1100 marks.",
      icon: FontAwesomeIcons.userGraduate,
      color: AppColors.accent,
    ),
    EducationModel(
      period: "2018 - 2020",
      title: "Matriculation",
      subtitle: "Dawn Science School",
      description: "Completed secondary education with high honors, securing 1011/1100 marks in Science group.",
      icon: FontAwesomeIcons.school,
      color: AppColors.secondary,
    ),
  ];
}
