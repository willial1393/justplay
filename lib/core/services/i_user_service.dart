import 'package:justplay/core/entities/user.dart';

abstract class IUserService {
  Future<User?> currentUser();

  Future<void> register({required User user});

  Future<User> updatePreferences({
    required String uid,
    String? country,
    String? state,
    String? city,
    String? game,
  });
}
