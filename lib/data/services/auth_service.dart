import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';
import 'package:justplay/core/entities/user.dart';
import 'package:justplay/core/services/i_auth_service.dart';
import 'package:justplay/core/services/i_user_service.dart';

@Injectable(as: IAuthService)
class AuthService implements IAuthService {
  final IUserService userService;

  AuthService(this.userService);

  @override
  bool isLoggedIn() {
    return auth.FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() {
    return auth.FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final user =
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await userService.register(
      user: User(
        uid: user.user!.uid,
        email: email,
        name: name,
      ),
    );
    await user.user!.updateDisplayName(name);
  }
}
