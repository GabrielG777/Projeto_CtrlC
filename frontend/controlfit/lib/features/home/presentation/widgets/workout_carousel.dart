import 'package:flutter/material.dart';

import 'workout_carousel_card.dart';

class WorkoutCarousel extends StatelessWidget {
  const WorkoutCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = [
      'Treino A',
      'Treino B',
      'Treino C',
      'Treino D',
    ];

    return SizedBox(
      height: 180,

      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.82,
        ),

        itemCount: workouts.length,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),

            child: WorkoutCarouselCard(
              title: workouts[index],
            ),
          );
        },
      ),
    );
  }
}