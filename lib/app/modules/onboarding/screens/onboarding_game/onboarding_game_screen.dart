import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class OnboardingGameScreen extends StatelessWidget {
  const OnboardingGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const JpScaffold(
      body: Center(
        child: Text('Game'),
      ),
    );
  }
}
