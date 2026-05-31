import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'workout_info_chip.dart';

class WorkoutHeaderCard extends StatelessWidget {
  final String workoutTitle;
  final int exerciseCount;

  const WorkoutHeaderCard({
    super.key,
    required this.workoutTitle,
    required this.exerciseCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const Icon(
                  Icons.fitness_center,
                  color: Colors.white,
                ),
              ),

              const Icon(
                Icons.local_fire_department,
                color: Colors.white,
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text(
            workoutTitle,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Treino personalizado do aluno',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [

              const WorkoutInfoChip(
                icon: Icons.timer_outlined,
                text: '75 min',
              ),

              const SizedBox(width: 12),

              WorkoutInfoChip(
                icon: Icons.list_alt_outlined,
                text: '$exerciseCount exercícios',
              ),
            ],
          ),
        ],
      ),
    );
  }
}