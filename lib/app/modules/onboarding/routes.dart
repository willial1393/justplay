import 'package:auto_route/auto_route.dart';
import 'package:justplay/app/routes/jp_router.dart';

final onboardingRoutes = [
  AutoRoute(page: OnboardingGameRoute.page),
  AutoRoute(page: OnboardingPreferencesRoute.page),
  AutoRoute(page: OnboardingLoginRoute.page),
];
