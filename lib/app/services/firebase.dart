import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:justplay/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  Future<FirebaseApp> get firebase {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
