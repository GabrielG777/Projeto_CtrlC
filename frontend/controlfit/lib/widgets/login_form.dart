import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/auth_exception.dart';
import '../services/auth_service.dart';
import '../theme/app_colors.dart';
import '../utils/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.authService,
    required this.onSuccess,
    this.onForgotPassword,
    this.onCreateAccount,
  });

  final AuthService authService;
  final VoidCallback onSuccess;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onCreateAccount;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscure = true;
  bool _loading = false;
  String? _error;

  late final AnimationController _shake;

  @override
  void initState() {
    super.initState();
    _shake = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _shake.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    setState(() => _error = null);

    if (!(_formKey.currentState?.validate() ?? false)) {
      _shake.forward(from: 0);
      return;
    }

    setState(() => _loading = true);
    try {
      await widget.authService.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (mounted) widget.onSuccess();
    } on AuthException catch (e) {
      if (mounted) {
        setState(() => _error = e.message);
        _shake.forward(from: 0);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = AuthException.serverError().message);
        _shake.forward(from: 0);
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shake,
      builder: (context, child) {
        final dx = math.sin(_shake.value * math.pi * 4) * 6 * _shake.value;
        return Transform.translate(offset: Offset(dx, 0), child: child);
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem-vindo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Entre na sua conta',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 24),
            if (_error != null) ...[
              _ErrorBox(message: _error!),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              enabled: !_loading,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
              validator: Validators.email,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscure,
              textInputAction: TextInputAction.done,
              enabled: !_loading,
              onFieldSubmitted: (_) => _submit(),
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              validator: Validators.password,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _loading ? null : widget.onForgotPassword,
                child: const Text('Esqueceu sua senha?'),
              ),
            ),
            const SizedBox(height: 8),
            _PrimaryButton(
              label: 'Entrar',
              loading: _loading,
              onPressed: _loading ? null : _submit,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _loading ? null : widget.onCreateAccount,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                side: const BorderSide(color: AppColors.border),
              ),
              child: const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.loading,
    this.onPressed,
  });

  final String label;
  final bool loading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: onPressed != null ? AppColors.brandGradient : null,
            color: onPressed == null ? AppColors.border : null,
            boxShadow: onPressed != null
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.background,
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.background,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}
