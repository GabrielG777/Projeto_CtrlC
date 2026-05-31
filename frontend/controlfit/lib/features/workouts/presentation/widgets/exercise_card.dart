import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String series;
  final String muscle;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.series,
    required this.muscle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.fitness_center,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  muscle,
                  style: const TextStyle(
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                series,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Séries',
                style: TextStyle(
                  color: AppColors.subtitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}