// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'jp_router.dart';

abstract class _$JpRouter extends RootStackRouter {
  // ignore: unused_element
  _$JpRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChargingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChargingScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingCongratulationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingCongratulationsScreen(),
      );
    },
    OnboardingGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingGameScreen(),
      );
    },
    OnboardingLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingLoginScreen(),
      );
    },
    OnboardingPreferencesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPreferencesScreen(),
      );
    },
  };
}

/// generated route for
/// [ChargingScreen]
class ChargingRoute extends PageRouteInfo<void> {
  const ChargingRoute({List<PageRouteInfo>? children})
      : super(
          ChargingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChargingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingCongratulationsScreen]
class OnboardingCongratulationsRoute extends PageRouteInfo<void> {
  const OnboardingCongratulationsRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingCongratulationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingCongratulationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingGameScreen]
class OnboardingGameRoute extends PageRouteInfo<void> {
  const OnboardingGameRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingLoginScreen]
class OnboardingLoginRoute extends PageRouteInfo<void> {
  const OnboardingLoginRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPreferencesScreen]
class OnboardingPreferencesRoute extends PageRouteInfo<void> {
  const OnboardingPreferencesRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingPreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingPreferencesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
