import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

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
      duration: const Duration(seconds: 10),
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
            const DecoratedBox(
              decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
            ),
            _orb(
              Alignment(-0.7 + math.sin(t * 2 * math.pi) * 0.1, -0.5),
              AppColors.primary,
            ),
            _orb(
              Alignment(0.8 + math.cos(t * 2 * math.pi) * 0.1, 0.6),
              AppColors.accent,
            ),
            CustomPaint(painter: _GridPainter()),
            widget.child,
          ],
        );
      },
    );
  }

  Widget _orb(Alignment alignment, Color color) {
    return Align(
      alignment: alignment,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.2),
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.04)
      ..strokeWidth = 0.5;
    const step = 48.0;
    for (var x = 0.0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
