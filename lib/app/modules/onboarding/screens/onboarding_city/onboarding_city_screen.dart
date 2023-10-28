import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_city/onboarding_provider.dart';
import 'package:justplay/app/services/notifications.dart';
import 'package:justplay/app/widgets/inputs/jp_dropdown.dart';
import 'package:justplay/app/widgets/jp_button.dart';
import 'package:justplay/app/widgets/jp_exit_app.dart';
import 'package:justplay/app/widgets/jp_loading.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class OnboardingCityScreen extends ConsumerStatefulWidget {
  const OnboardingCityScreen({super.key});

  @override
  ConsumerState<OnboardingCityScreen> createState() =>
      _OnboardingCityScreenState();
}

class _OnboardingCityScreenState extends ConsumerState<OnboardingCityScreen> {
  bool loading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      unawaited(_fetchCountries());
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboarding = ref.watch(onboardingProvider);
    return JpScaffold(
      body: JpExitApp(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (loading)
                const Center(
                  child: JpLoading(),
                ),
              if (error)
                Center(
                  child: JpButton(text: 'Retry', onPressed: _fetchCountries),
                ),
              if (!loading && !error)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JpDropdown(
                      label: 'Country',
                      value: onboarding.country,
                      options: onboarding.countries,
                      onChanged: (String? value) {
                        if (value != null) {
                          ref
                              .read(onboardingProvider.notifier)
                              .setCountry(value);
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    JpDropdown(
                      label: 'State',
                      value: onboarding.state,
                      options: onboarding.states,
                      onChanged: (String? value) {
                        if (value != null) {
                          ref.read(onboardingProvider.notifier).setState(value);
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    JpDropdown(
                      label: 'City',
                      value: onboarding.city,
                      options: onboarding.cities,
                      onChanged: (String? value) {
                        if (value != null) {
                          ref.read(onboardingProvider.notifier).setCity(value);
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    JpButton(text: 'Next', onPressed: _next),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchCountries() async {
    setState(() {
      loading = true;
      error = false;
    });
    try {
      await ref.read(onboardingProvider.notifier).fetchCountries();
    } catch (e) {
      error = true;
      JpNotification.error('Error fetching countries');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _next() async {}
}
