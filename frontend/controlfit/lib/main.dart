import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/login_screen.dart';
import 'services/auth_service.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
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
      home: LoginScreen(authService: FakeAuthService()),
    );
  }
}
