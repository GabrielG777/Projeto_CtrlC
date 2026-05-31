import 'package:controlfit/core/theme/app_colors.dart';
import 'package:controlfit/features/home/presentation/widgets/app_bottom_navigation.dart';
import 'package:controlfit/features/home/presentation/widgets/home_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  final pages = [
    const HomeContent(),
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