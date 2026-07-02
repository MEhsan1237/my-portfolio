import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practice_web/utils/constants.dart';
import 'package:practice_web/components/custom_animations.dart';
import '../models/project_model.dart';
import 'package:practice_web/view_models/projects_view_model.dart';
import '../components/launch_url.dart';

class ProjectsView extends StatelessWidget {
  final bool animateRow1;
  final Key? row2Key;
  final bool animateRow2;
  final Key? row3Key;
  final bool animateRow3;
  final ProjectsViewModel viewModel = ProjectsViewModel();
  
  ProjectsView({
    super.key, 
    this.animateRow1 = false,
    this.row2Key,
    this.animateRow2 = false,
    this.row3Key,
    this.animateRow3 = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.06,
        bottom: 50,
        left: isMobile ? 20 : size.width * 0.05,
        right: isMobile ? 20 : size.width * 0.05,
      ),
      child: Column(
        children: [
          SectionAnimation(
            animate: animateRow1,
            child: _buildHeader(size),
          ),
          SizedBox(height: size.height * 0.08),
          
          // Row 1
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: viewModel.projectsRow1.map((project) => _projectCard(project, animateRow1, 200)).toList(),
          ),
          
          SizedBox(height: size.height * 0.04),
          
          // Row 2
          Wrap(
            key: row2Key,
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: viewModel.projectsRow2.map((project) => _projectCard(project, animateRow2, 100)).toList(),
          ),
          
          SizedBox(height: size.height * 0.04),
          
          // Row 3
          Wrap(
            key: row3Key,
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: viewModel.projectsRow3.map((project) => _projectCard(project, animateRow3, 150)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "PORTFOLIO",
            style: AppStyles.sectionTag.copyWith(letterSpacing: 4),
          ),
        ),
        SizedBox(height: size.height * 0.016),
        Text(
          "Featured Projects",
          style: AppStyles.heading.copyWith(fontSize: 32),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _projectCard(ProjectModel data, bool animate, int delayMs) {
    return CustomHoverCard(
      highlightColor: AppColors.primary,
      animate: animate,
      delay: delayMs.ms,
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.asset(
                data.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: data.tags.map((tag) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: AppStyles.tagStyle,
                      ),
                    )).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data.title,
                    style: AppStyles.projectTitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data.description,
                    style: AppStyles.body.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  RowLaunchScreen(url: data.url, icon: Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

