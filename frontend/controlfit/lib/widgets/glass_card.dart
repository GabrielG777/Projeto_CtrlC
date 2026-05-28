import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surfaceGlass,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.7)),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.08),
                blurRadius: 40,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: child,
          ),
        ),
      ),
    );
  }
}
