import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justplay/app/providers/app_state.dart';
import 'package:justplay/core/entities/user.dart';
import 'package:justplay/core/services/i_user_service.dart';
import 'package:justplay/injectable.dart';

class AppProvider extends StateNotifier<AppState> {
  final IUserService userService;

  AppProvider({required this.userService}) : super(const AppState());

  void updateUser({required User user}) {
    state = state.copyWith(user: user);
  }
}

final appProvider = StateNotifierProvider<AppProvider, AppState>((ref) {
  return AppProvider(
    userService: getIt<IUserService>(),
  );
});
