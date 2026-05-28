import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/ctrlfit_logo.dart';
import '../widgets/glass_card.dart';
import '../widgets/login_background.dart';
import '../widgets/login_form.dart';

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
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _entry = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fade = CurvedAnimation(parent: _entry, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entry, curve: Curves.easeOutCubic));
    _entry.forward();
  }

  @override
  void dispose() {
    _entry.dispose();
    super.dispose();
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = Responsive.isWide(context);

    return Scaffold(
      body: LoginBackground(
        child: SafeArea(
          child: FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slide,
              child: wide ? _wideLayout() : _narrowLayout(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _narrowLayout() {
    return Center(
      child: SingleChildScrollView(
        padding: Responsive.padding(context),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Responsive.maxFormWidth(context)),
          child: Column(
            children: [
              const CtrlFitLogo(),
              const SizedBox(height: 32),
              _card(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wideLayout() {
    return Padding(
      padding: Responsive.padding(context),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CtrlFitLogo(),
                const SizedBox(height: 32),
                Text(
                  'Disciplina hoje.\nResultados amanhã.',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Controle alunos, treinos e resultados em um painel moderno.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: _card(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return GlassCard(
      child: LoginForm(
        authService: widget.authService,
        onSuccess: () => _snack('Login realizado com sucesso!'),
        onForgotPassword: () => _snack('Recuperação de senha — em breve'),
        onCreateAccount: () => _snack('Cadastro — em breve'),
      ),
    );
  }
}
