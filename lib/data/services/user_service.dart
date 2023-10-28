import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';
import 'package:justplay/core/entities/user.dart';
import 'package:justplay/core/services/i_user_service.dart';

@Injectable(as: IUserService)
class UserService implements IUserService {
  final users = FirebaseFirestore.instance.collection('users');

  @override
  Future<User> currentUser() async {
    final user = auth.FirebaseAuth.instance.currentUser;
    final res = await users.doc(user?.uid).get();
    return User().fromJson(res.data() ?? {});
  }

  @override
  Future<void> register({required User user}) {
    return users.doc(user.uid).set(user.toJson());
  }
}
