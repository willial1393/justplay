import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class OnboardingLoginScreen extends StatelessWidget {
  const OnboardingLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const JpScaffold(
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
