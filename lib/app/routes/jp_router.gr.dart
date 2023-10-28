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
    OnboardingCityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingCityScreen(),
      );
    },
    OnboardingCountryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingCountryScreen(),
      );
    },
    OnboardingLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingLoginScreen(),
      );
    },
    OnboardingRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingRegisterScreen(),
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
/// [OnboardingCityScreen]
class OnboardingCityRoute extends PageRouteInfo<void> {
  const OnboardingCityRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingCityRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingCityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingCountryScreen]
class OnboardingCountryRoute extends PageRouteInfo<void> {
  const OnboardingCountryRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingCountryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingCountryRoute';

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
/// [OnboardingRegisterScreen]
class OnboardingRegisterRoute extends PageRouteInfo<void> {
  const OnboardingRegisterRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
