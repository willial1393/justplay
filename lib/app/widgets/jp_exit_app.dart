import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class JpExitApp extends StatelessWidget {
  final Widget child;

  const JpExitApp({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text('Tap back again to leave'),
      ),
      child: child,
    );
  }
}
