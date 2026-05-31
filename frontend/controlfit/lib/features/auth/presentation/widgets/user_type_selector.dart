import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

enum UserType {
  student,
  trainer,
}

class UserTypeSelector extends StatelessWidget {
  final UserType selectedType;
  final Function(UserType) onChanged;

  const UserTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: _buildCard(
            title: 'Aluno',
            icon: Icons.person_outline,
            type: UserType.student,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: _buildCard(
            title: 'Personal',
            icon: Icons.fitness_center,
            type: UserType.trainer,
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required UserType type,
  }) {
    final isSelected = selectedType == type;

    return GestureDetector(
      onTap: () => onChanged(type),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Colors.white,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.shade300,
          ),
        ),

        child: Column(
          children: [

            Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : AppColors.primary,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Colors.white
                    : AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}