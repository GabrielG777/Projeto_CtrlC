import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/workout_detail_content.dart';

class WorkoutDetailPage extends StatelessWidget {
  final String workoutTitle;

  const WorkoutDetailPage({
    super.key,
    required this.workoutTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: AppColors.text,
        ),

        title: Text(
          workoutTitle,
          style: const TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: WorkoutDetailContent(
        workoutTitle: workoutTitle,
      ),
    );
  }
}