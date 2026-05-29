import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/login_screen.dart';
import 'services/auth_service.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';
import 'utils/responsive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const CtrlFitApp());
}

class CtrlFitApp extends StatelessWidget {
  const CtrlFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control Fit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        final width = MediaQuery.sizeOf(context).width;
        if (width <= Responsive.appMaxWidth) return child;
        return ColoredBox(
          color: const Color(0xFF050608),
          child: child,
        );
      },
      home: LoginScreen(authService: FakeAuthService()),
    );
  }
}
