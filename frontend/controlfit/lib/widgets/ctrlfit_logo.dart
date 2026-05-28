import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CtrlFitLogo extends StatelessWidget {
  const CtrlFitLogo({super.key, this.large = true});

  final bool large;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: large ? 64 : 52,
          height: large ? 64 : 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: AppColors.brandGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            Icons.fitness_center_rounded,
            color: AppColors.background,
            size: 32,
          ),
        ),
        SizedBox(height: large ? 18 : 12),
        ShaderMask(
          shaderCallback: (b) => AppColors.brandGradient.createShader(b),
          child: Text(
            'Control Fit',
            style: GoogleFonts.inter(
              fontSize: large ? 32 : 26,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
        ),
        if (large) ...[
          const SizedBox(height: 8),
          Text(
            'Academia · Tecnologia · Performance',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                  letterSpacing: 1,
                ),
          ),
        ],
      ],
    );
  }
}
