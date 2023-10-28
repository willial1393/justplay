import 'package:flutter/material.dart';

class JpScaffold extends StatelessWidget {
  final Widget body;

  const JpScaffold({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
