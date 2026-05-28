abstract final class Validators {
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Informe seu e-mail';
    final regex = RegExp(r'^[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value.trim())) return 'Digite um e-mail válido';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Informe sua senha';
    if (value.length < 6) return 'Mínimo de 6 caracteres';
    return null;
  }
}
