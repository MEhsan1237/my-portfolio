import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_web/utils/constants.dart';
import '../models/stat_model.dart';

class StatsViewModel {
  final List<StatModel> stats = [
    StatModel(value: "20+", label: "Projects Completed", icon: FontAwesomeIcons.diagramProject, color: AppColors.primary),
    StatModel(value: "3+", label: "Years of Experience", icon: FontAwesomeIcons.laptopCode, color: AppColors.accent),
    StatModel(value: "10+", label: "Technologies Used", icon: FontAwesomeIcons.stackOverflow, color: AppColors.secondary),
  ];
}
