import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justplay/app/providers/app_provider.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/widgets/jp_loading.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';
import 'package:justplay/core/services/i_auth_service.dart';
import 'package:justplay/injectable.dart';

@RoutePage()
class ChargingScreen extends ConsumerStatefulWidget {
  const ChargingScreen({super.key});

  @override
  ConsumerState<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends ConsumerState<ChargingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (getIt<IAuthService>().isLoggedIn()) {
        ref.read(appProvider.notifier).updateUser();
        await appRouter.replace(const HomeRoute());
      } else {
        await appRouter.replace(const OnboardingLoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const JpScaffold(
      body: Center(
        child: JpLoading(),
      ),
    );
  }
}
