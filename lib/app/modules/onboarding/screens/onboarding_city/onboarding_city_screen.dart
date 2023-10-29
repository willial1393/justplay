import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_city/onboarding_provider.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_city/onboarding_state.dart';
import 'package:justplay/app/providers/app_provider.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/services/notifications.dart';
import 'package:justplay/app/widgets/inputs/jp_dropdown.dart';
import 'package:justplay/app/widgets/jp_button.dart';
import 'package:justplay/app/widgets/jp_exit_app.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class OnboardingCityScreen extends ConsumerWidget {
  const OnboardingCityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingProvider);
    return JpScaffold(
      body: JpExitApp(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (onboarding.status == OnboardingStatus.errorCountry)
                JpButton(
                  text: 'Retry',
                  onPressed: () async =>
                      ref.read(onboardingProvider.notifier).fetchCountries(),
                ),
              if (onboarding.status == OnboardingStatus.errorState)
                JpButton(
                  text: 'Retry',
                  onPressed: () async => ref
                      .read(onboardingProvider.notifier)
                      .fetchStates(country: onboarding.country!),
                ),
              if (onboarding.status == OnboardingStatus.errorCity)
                JpButton(
                  text: 'Retry',
                  onPressed: () async => ref
                      .read(onboardingProvider.notifier)
                      .fetchCities(state: onboarding.state!),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  JpDropdown(
                    label: 'Country',
                    value: onboarding.country,
                    options: onboarding.countries,
                    loading:
                        onboarding.status == OnboardingStatus.loadingCountry,
                    onChanged: (String? value) {
                      if (value != null) {
                        ref.read(onboardingProvider.notifier).setCountry(value);
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  JpDropdown(
                    label: 'State',
                    value: onboarding.state,
                    options: onboarding.states,
                    loading: onboarding.status == OnboardingStatus.loadingState,
                    onChanged: (String? value) {
                      ref.read(onboardingProvider.notifier).setState(value);
                    },
                  ),
                  SizedBox(height: 15.h),
                  JpDropdown(
                    label: 'City',
                    value: onboarding.city,
                    options: onboarding.cities,
                    loading: onboarding.status == OnboardingStatus.loadingCity,
                    onChanged: (String? value) {
                      ref.read(onboardingProvider.notifier).setCity(value);
                    },
                  ),
                  SizedBox(height: 15.h),
                  JpButton(
                    text: 'Next',
                    onPressed: () async => _next(ref),
                    enabled: _enable(onboarding: onboarding),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _enable({required OnboardingState onboarding}) {
    return (onboarding.country != null &&
        onboarding.state != null &&
        onboarding.city != null);
  }

  Future<void> _next(WidgetRef ref) async {
    try {
      final country = ref.read(onboardingProvider).country;
      final state = ref.read(onboardingProvider).state;
      final city = ref.read(onboardingProvider).city;
      await ref
          .read(appProvider.notifier)
          .updateLocation(country: country!, state: state!, city: city!);
      JpNotification.success('Location updated');
      await appRouter.pushAndPopUntil(
        const HomeRoute(),
        predicate: (route) => true,
      );
    } catch (e) {
      JpNotification.error('Something went wrong');
    }
  }
}
