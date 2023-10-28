abstract class IAuthService {
  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String email,
    required String password,
    required String name,
  });

  Future<void> logout();

  bool isLoggedIn();
}
