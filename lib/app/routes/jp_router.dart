import 'package:auto_route/auto_route.dart';
import 'package:justplay/app/modules/charging/charging_screen.dart';
import 'package:justplay/app/modules/home/home_screen.dart';
import 'package:justplay/app/modules/onboarding/routes.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_city/onboarding_city_screen.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_game/onboarding_game_screen.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_login/onboarding_login_screen.dart';

part 'jp_router.gr.dart';

@AutoRouterConfig()
class JpRouter extends _$JpRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ChargingRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        ...onboardingRoutes,
      ];
}

final appRouter = JpRouter();
