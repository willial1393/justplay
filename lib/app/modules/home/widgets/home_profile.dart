import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/core/services/i_auth_service.dart';
import 'package:justplay/injectable.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('HomeProfile'),
          GestureDetector(
            onTap: () async {
              await _logout(context);
            },
            child: const Text(
              'Close session',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await getIt<IAuthService>().logout();
    await appRouter.pushAndPopUntil(
      const ChargingRoute(),
      predicate: (route) => true,
    );
    Phoenix.rebirth(appRouter.navigatorKey.currentContext!);
  }
}
