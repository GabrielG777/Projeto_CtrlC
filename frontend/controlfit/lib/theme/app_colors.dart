import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF0A0B0F);
  static const Color surface = Color(0xFF161922);
  static const Color surfaceGlass = Color(0xCC161922);
  static const Color border = Color(0xFF2A2F3D);

  static const Color primary = Color(0xFF00E5A0);
  static const Color accent = Color(0xFF3D8BFF);
  static const Color textPrimary = Color(0xFFF4F6FA);
  static const Color textSecondary = Color(0xFF9CA3B8);
  static const Color textMuted = Color(0xFF6B7289);
  static const Color error = Color(0xFFFF6B6B);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A0B0F), Color(0xFF0D1117), Color(0xFF0A1218)],
  );

  static const LinearGradient brandGradient = LinearGradient(
    colors: [Color(0xFF00E5A0), Color(0xFF3D8BFF)],
  );
}
