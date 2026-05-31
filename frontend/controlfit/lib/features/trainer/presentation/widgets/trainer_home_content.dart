import 'package:controlfit/features/trainer/presentation/pages/create_workout_page.dart';
import 'package:flutter/material.dart';

import 'activity_card.dart';
import 'quick_action_card.dart';
import 'student_carousel.dart';
import 'trainer_header.dart';
import 'trainer_stat_card.dart';

class TrainerHomeContent extends StatelessWidget {
  const TrainerHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TrainerHeader(),
            const SizedBox(height: 32),
            Row(
              children: const [
                Expanded(
                  child: TrainerStatCard(
                    value: '24',
                    label: 'Alunos',
                    icon: Icons.people_outline,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TrainerStatCard(
                    value: '12',
                    label: 'Ativos Hoje',
                    icon: Icons.local_fire_department,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Seus Alunos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const StudentCarousel(),
            const SizedBox(height: 32),
            const Text(
              'Ações rápidas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children:  [
                QuickActionCard(
                  title: 'Novo Treino',
                  icon: Icons.add_circle_outline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateWorkoutPage(),
                      ),
                    );
                  },
                ),
                QuickActionCard(
                  title: 'Agendamentos',
                  icon: Icons.calendar_month_outlined,
                ),
                QuickActionCard(
                  title: 'Avaliações',
                  icon: Icons.bar_chart_outlined,
                ),
                QuickActionCard(
                  title: 'Mensagens',
                  icon: Icons.chat_bubble_outline,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Atividades recentes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const ActivityCard(
              title: 'João concluiu o treino A',
              time: 'há 15 minutos',
            ),
            const SizedBox(height: 12),
            const ActivityCard(
              title: 'Maria iniciou treino B',
              time: 'há 32 minutos',
            ),
          ],
        ),
      ),
    );
  }
}
