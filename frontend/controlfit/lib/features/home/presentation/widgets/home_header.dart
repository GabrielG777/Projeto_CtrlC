import 'package:controlfit/features/home/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
                    text: 'João',
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
              'Vamos treinar hoje?',
              style: TextStyle(
                color: AppColors.subtitle,
                fontSize: 16,
              ),
            ),
          ],
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfilePage(),
              ),
            );
          },

          child: CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primary,

            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}