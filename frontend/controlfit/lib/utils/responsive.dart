import 'package:flutter/material.dart';

abstract final class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isWide(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 900;

  static double maxFormWidth(BuildContext context) {
    if (isWide(context)) return 440;
    return double.infinity;
  }

  static EdgeInsets padding(BuildContext context) {
    if (isWide(context)) {
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 32);
    }
    return const EdgeInsets.symmetric(horizontal: 24, vertical: 20);
  }
}
