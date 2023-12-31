import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/modules/onboarding/onboarding_provider.dart';
import 'package:justplay/app/providers/app_provider.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/services/notifications.dart';
import 'package:justplay/app/widgets/jp_retry.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';
import 'package:justplay/core/services/i_user_service.dart';
import 'package:justplay/gen/assets.gen.dart';
import 'package:justplay/injectable.dart';

@RoutePage()
class ChargingScreen extends ConsumerStatefulWidget {
  const ChargingScreen({super.key});

  @override
  ConsumerState<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends ConsumerState<ChargingScreen> {
  bool error = false;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      unawaited(_fetchCharging());
    });
  }

  @override
  Widget build(BuildContext context) {
    return JpScaffold(
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (loading) Assets.animations.loading.lottie(width: 0.8.sw),
            if (error)
              JpRetry(
                onPressed: _fetchCharging,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchCharging() async {
    setState(() {
      loading = true;
      error = false;
    });
    try {
      final user = await getIt<IUserService>().currentUser();
      if (user != null) {
        ref.read(appProvider.notifier).updateUser(user: user);
        if (user.country == null ||
            user.state == null ||
            user.city == null ||
            user.game == null) {
          await ref.read(onboardingProvider.notifier).fetchCountries();
          await appRouter.pushAndPopUntil(
            const OnboardingPreferencesRoute(),
            predicate: (route) => true,
          );
          return;
        }
        await appRouter.replace(const HomeRoute());
      } else {
        await appRouter.replace(const OnboardingLoginRoute());
      }
    } catch (e) {
      error = true;
      JpNotification.error('Error fetching user');
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }
}
