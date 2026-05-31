import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TrainerHeader extends StatelessWidget {
  const TrainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            RichText(
              text: const TextSpan(
                children: [

                  TextSpan(
                    text: 'Olá, ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),

                  TextSpan(
                    text: 'Personal',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 4),

            Text(
              'Gerencie seus alunos',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.subtitle,
              ),
            ),
          ],
        ),

        CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.primary,

          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}