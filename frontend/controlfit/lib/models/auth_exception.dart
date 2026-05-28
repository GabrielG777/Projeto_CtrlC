class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  factory AuthException.invalidCredentials() => const AuthException(
        'E-mail ou senha incorretos. Verifique e tente novamente.',
      );

  factory AuthException.serverError() => const AuthException(
        'Erro inesperado. Tente novamente em instantes.',
      );

  @override
  String toString() => message;
}
