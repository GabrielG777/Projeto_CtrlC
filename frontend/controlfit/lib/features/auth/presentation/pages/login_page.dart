import 'package:controlfit/features/auth/presentation/widgets/login_form.dart';
import 'package:controlfit/features/auth/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  LoginHeader(),
                  SizedBox(height: 40),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}