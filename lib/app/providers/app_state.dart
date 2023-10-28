import 'package:flutter/cupertino.dart';
import 'package:justplay/core/entities/user.dart';

@immutable
class AppState {
  final User? user;

  const AppState({
    this.user,
  });

  AppState copyWith({
    User? user,
  }) {
    return AppState(
      user: user ?? this.user,
    );
  }
}
