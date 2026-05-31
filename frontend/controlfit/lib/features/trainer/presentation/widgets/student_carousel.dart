import 'package:flutter/material.dart';

import 'student_card.dart';

class StudentCarousel extends StatelessWidget {
  const StudentCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      {
        'name': 'João Silva',
        'workout': 'Treino A',
      },
      {
        'name': 'Maria Oliveira',
        'workout': 'Treino B',
      },
      {
        'name': 'Carlos Souza',
        'workout': 'Treino C',
      },
    ];

    return SizedBox(
      height: 200,

      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.85,
        ),

        itemCount: students.length,

        itemBuilder: (context, index) {
          final student = students[index];

          return Padding(
            padding: const EdgeInsets.only(right: 16),

            child: StudentCard(
              name: student['name']!,
              workout: student['workout']!,
            ),
          );
        },
      ),
    );
  }
}