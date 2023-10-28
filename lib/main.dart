import 'package:flutter/material.dart';
import 'package:justplay/app/app.dart';
import 'package:justplay/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
