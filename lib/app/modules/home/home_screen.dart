import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:justplay/app/widgets/jp_exit_app.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const JpExitApp(
      child: JpScaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
