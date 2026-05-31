import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/widgets/app_bottom_navigation.dart';
import '../widgets/trainer_home_content.dart';

class TrainerHomePage extends StatefulWidget {
  const TrainerHomePage({super.key});

  @override
  State<TrainerHomePage> createState() => _TrainerHomePageState();
}

class _TrainerHomePageState extends State<TrainerHomePage> {
  int currentIndex = 0;

  final pages = [
    const TrainerHomeContent(),
    const Center(child: Text('TREINOS')),
    const Center(child: Text('PERFIL')),
    const Center(child: Text('INFO')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: pages[currentIndex],

      bottomNavigationBar: AppBottomNavigation(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}