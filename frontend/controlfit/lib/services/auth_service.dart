import '../models/auth_exception.dart';
import '../models/user_model.dart';

/// Contrato para troca futura por implementação HTTP.
abstract class AuthService {
  Future<UserModel> signIn({required String email, required String password});
}

/// Demo: demo@ctrlfit.app / ctrlfit
class FakeAuthService implements AuthService {
  static const _demoEmail = 'demo@ctrlfit.app';
  static const _demoPassword = 'ctrlfit';

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    final normalized = email.trim().toLowerCase();
    if (normalized != _demoEmail || password != _demoPassword) {
      throw AuthException.invalidCredentials();
    }

    return UserModel(
      id: '1',
      email: normalized,
      name: 'Usuário Demo',
    );
  }
}
