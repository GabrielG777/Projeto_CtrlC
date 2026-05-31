import 'package:flutter/material.dart';

import 'exercise_card.dart';
import 'start_workout_button.dart';
import 'workout_header_card.dart';

class WorkoutDetailContent extends StatelessWidget {
  final String workoutTitle;

  const WorkoutDetailContent({
    super.key,
    required this.workoutTitle,
  });

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'name': 'Supino Reto',
        'series': '4x12',
        'muscle': 'Peito',
      },
      {
        'name': 'Crucifixo',
        'series': '3x15',
        'muscle': 'Peito',
      },
      {
        'name': 'Tríceps Pulley',
        'series': '4x10',
        'muscle': 'Tríceps',
      },
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            WorkoutHeaderCard(
              workoutTitle: workoutTitle,
              exerciseCount: exercises.length,
            ),

            const SizedBox(height: 32),

            const Text(
              'Exercícios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ...exercises.map(
              (exercise) => Padding(
                padding: const EdgeInsets.only(bottom: 16),

                child: ExerciseCard(
                  title: exercise['name']!,
                  series: exercise['series']!,
                  muscle: exercise['muscle']!,
                ),
              ),
            ),

            const SizedBox(height: 32),

            const StartWorkoutButton(),
          ],
        ),
      ),
    );
  }
}