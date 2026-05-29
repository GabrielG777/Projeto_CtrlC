import 'package:flutter/material.dart';

abstract final class Responsive {
  /// Largura máxima do “celular” ao abrir no navegador/desktop.
  static const double appMaxWidth = 430;

  static bool showPhoneFrame(BuildContext context) =>
      MediaQuery.sizeOf(context).width > appMaxWidth;

  static EdgeInsets screenPadding(BuildContext context) {
    final bottom = MediaQuery.viewPaddingOf(context).bottom;
    return EdgeInsets.fromLTRB(24, 8, 24, bottom > 0 ? 16 : 24);
  }
}
