import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../workouts/presentation/pages/workout_detail_page.dart';

class WorkoutCarouselCard extends StatelessWidget {
  final String title;

  const WorkoutCarouselCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WorkoutDetailPage(
              workoutTitle: title,
            ),
          ),
        );
      },

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: const Icon(
                    Icons.fitness_center,
                    color: AppColors.primary,
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ],
            ),

            const Spacer(),

            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Treino personalizado',
              style: TextStyle(
                color: AppColors.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}