import 'package:flutter/material.dart';

class JpScaffold extends StatelessWidget {
  final Widget body;

  const JpScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
