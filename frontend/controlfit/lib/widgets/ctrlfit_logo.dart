import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

/// Marca no topo da tela — estilo splash de app.
class CtrlFitLogo extends StatelessWidget {
  const CtrlFitLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: AppColors.brandGradient,
          ),
          child: const Icon(
            Icons.fitness_center_rounded,
            color: AppColors.background,
            size: 28,
          ),
        ),
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (b) => AppColors.brandGradient.createShader(b),
          child: Text(
            'Control Fit',
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }
}
