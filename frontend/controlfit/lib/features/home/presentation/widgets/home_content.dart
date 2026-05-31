import 'package:flutter/material.dart';

import 'home_header.dart';
import 'hydration_tip_card.dart';
import 'recent_workout_card.dart';
import 'stat_card.dart';
import 'workout_carousel.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const HomeHeader(),

            const SizedBox(height: 32),

            Row(
              children: const [

                Expanded(
                  child: StatCard(
                    value: '12',
                    label: 'Treinos',
                    icon: Icons.local_fire_department,
                  ),
                ),

                SizedBox(width: 16),

                Expanded(
                  child: StatCard(
                    value: '5',
                    label: 'Sequência',
                    icon: Icons.bolt,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            const Text(
              'Seus Treinos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const WorkoutCarousel(),

            const SizedBox(height: 32),

            const Text(
              'Últimos Treinos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const RecentWorkoutCard(
              title: 'Treino A',
              subtitle: 'Ontem • 1h 12min',
            ),

            const SizedBox(height: 12),

            const RecentWorkoutCard(
              title: 'Treino B',
              subtitle: '2 dias atrás • 58min',
            ),

            const SizedBox(height: 32),

            const HydrationTipCard(),
          ],
        ),
      ),
    );
  }
}