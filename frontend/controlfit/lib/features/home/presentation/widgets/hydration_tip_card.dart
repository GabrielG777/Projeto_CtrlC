import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HydrationTipCard extends StatelessWidget {
  const HydrationTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          const Icon(
            Icons.water_drop_outlined,
            color: AppColors.primary,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Text(
                  'Dica do dia',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Mantenha-se hidratado durante o treino.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}