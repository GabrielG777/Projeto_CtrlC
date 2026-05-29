import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Fundo sutil estilo app — sem grid de dashboard web.
class LoginBackground extends StatefulWidget {
  const LoginBackground({super.key, required this.child});

  final Widget child;

  @override
  State<LoginBackground> createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        return Stack(
          fit: StackFit.expand,
          children: [
            const ColoredBox(color: AppColors.background),
            Positioned(
              top: -80,
              left: -40 + math.sin(t * 2 * math.pi) * 20,
              child: _glow(220, AppColors.primary.withValues(alpha: 0.18)),
            ),
            Positioned(
              bottom: 120,
              right: -60 + math.cos(t * 2 * math.pi) * 16,
              child: _glow(180, AppColors.accent.withValues(alpha: 0.12)),
            ),
            widget.child,
          ],
        );
      },
    );
  }

  Widget _glow(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
