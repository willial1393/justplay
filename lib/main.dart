import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:justplay/app/app.dart';
import 'package:justplay/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureDependencies();
  runApp(const App());
}
