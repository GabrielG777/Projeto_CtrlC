import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String workout;

  const StudentCard({
    super.key,
    required this.name,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),

                child: const Icon(
                  Icons.person,
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
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            workout,
            style: const TextStyle(
              color: AppColors.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}