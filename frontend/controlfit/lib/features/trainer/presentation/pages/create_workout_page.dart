import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({super.key});

  @override
  State<CreateWorkoutPage> createState() =>
      _CreateWorkoutPageState();
}

class _CreateWorkoutPageState
    extends State<CreateWorkoutPage> {

  String? selectedStudent;

  final students = [
    'João Silva',
    'Maria Oliveira',
    'Carlos Souza',
  ];

  final workoutController = TextEditingController();

  final exercises = <String>[];

  final exerciseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Novo Treino',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ALUNO
            const Text(
              'Selecionar aluno',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: selectedStudent,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),

              items: students.map((student) {
                return DropdownMenuItem(
                  value: student,
                  child: Text(student),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  selectedStudent = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // NOME TREINO
            const Text(
              'Nome do treino',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: workoutController,

              decoration: InputDecoration(
                hintText: 'Ex: Treino A',
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // EXERCÍCIOS
            const Text(
              'Exercícios',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: exerciseController,

                    decoration: InputDecoration(
                      hintText: 'Adicionar exercício',
                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                GestureDetector(
                  onTap: () {

                    if (exerciseController.text.isEmpty) {
                      return;
                    }

                    setState(() {
                      exercises.add(
                        exerciseController.text,
                      );

                      exerciseController.clear();
                    });
                  },

                  child: Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            ...exercises.map(
              (exercise) => Padding(
                padding: const EdgeInsets.only(bottom: 12),

                child: Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Row(
                    children: [

                      const Icon(
                        Icons.fitness_center,
                        color: AppColors.primary,
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          exercise,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 58,

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                child: const Text(
                  'Salvar treino',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}