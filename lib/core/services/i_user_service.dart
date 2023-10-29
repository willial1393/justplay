import 'package:justplay/core/entities/user.dart';

abstract class IUserService {
  Future<User?> currentUser();

  Future<void> register({required User user});

  Future<User> updateLocation({
    required String uid,
    required String country,
    required String state,
    required String city,
  });
}
