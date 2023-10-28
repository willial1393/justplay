import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';
import 'package:justplay/core/entities/user.dart';
import 'package:justplay/core/services/i_user_service.dart';

@Injectable(as: IUserService)
class UserService implements IUserService {
  @override
  User currentUser() {
    final user = auth.FirebaseAuth.instance.currentUser;
    return User(
      email: user?.email,
      name: user?.displayName,
      uid: user?.uid,
    );
  }
}
