import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:justplay/core/services/i_auth_service.dart';

@Injectable(as: IAuthService)
class AuthService implements IAuthService {
  @override
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await user.user!.updateDisplayName(name);
  }
}
