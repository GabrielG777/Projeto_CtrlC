import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/ctrlfit_logo.dart';
import '../widgets/login_background.dart';
import '../widgets/login_form.dart';

/// Tela de login mobile-first (app nativo).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.authService});

  final AuthService authService;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entry;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _entry = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = CurvedAnimation(parent: _entry, curve: Curves.easeOut);
    _entry.forward();
  }

  @override
  void dispose() {
    _entry.dispose();
    super.dispose();
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: LoginBackground(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final content = FadeTransition(
      opacity: _fade,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final topGap = (constraints.maxHeight * 0.06).clamp(24.0, 56.0);

            return SingleChildScrollView(
              padding: Responsive.screenPadding(context),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const CtrlFitLogo(),
                  const SizedBox(height: 28),
                  Text(
                    'Bem-vindo',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Disciplina hoje. Resultados amanhã.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                          height: 1.35,
                        ),
                  ),
                  SizedBox(height: topGap + 32),
                  LoginForm(
                        authService: widget.authService,
                        onSuccess: () => _snack('Login realizado com sucesso!'),
                        onForgotPassword: () =>
                            _snack('Recuperação de senha — em breve'),
                        onCreateAccount: () => _snack('Cadastro — em breve'),
                      ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );

    if (Responsive.showPhoneFrame(context)) {
      return Center(
        child: Container(
          width: Responsive.appMaxWidth,
          height: MediaQuery.sizeOf(context).height,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 48,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: content,
        ),
      );
    }

    return content;
  }
}
