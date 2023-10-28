import 'package:flutter/material.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/theme/jp_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Just Play',
      theme: JpTheme.light,
      routerConfig: appRouter.config(),
    );
  }
}
