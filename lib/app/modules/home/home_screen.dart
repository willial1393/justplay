import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/widgets/jp_button.dart';
import 'package:justplay/app/widgets/jp_exit_app.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';
import 'package:justplay/core/services/i_auth_service.dart';
import 'package:justplay/injectable.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return JpScaffold(
      body: JpExitApp(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello World'),
              SizedBox(height: 20.h),
              JpButton(
                text: 'Close session',
                onPressed: () async => _logout(context),
              ),
            ],
          ),
        ),
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
