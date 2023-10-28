import 'package:flutter/material.dart';
import 'package:justplay/app/theme/jp_theme.dart';
import 'package:justplay/app/widgets/jp_loading.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Play',
      theme: JpTheme.light,
      home: const Scaffold(
        body: Center(
          child: JpLoading(),
        ),
      ),
    );
  }
}
