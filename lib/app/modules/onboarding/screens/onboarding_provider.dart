import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_state.dart';
import 'package:justplay/app/providers/app_provider.dart';
import 'package:justplay/app/services/notifications.dart';
import 'package:justplay/core/entities/user.dart';
import 'package:justplay/core/services/i_country_service.dart';
import 'package:justplay/injectable.dart';

final List<String> _games = [
  'Soccer',
  'Football',
  'Basketball',
  'Volleyball',
  'Tennis',
  'Baseball',
  'Hockey',
  'Cricket',
  'Rugby',
  'Golf',
  'Badminton',
  'Table Tennis',
  'Ping Pong',
  'Snooker',
  'Chess',
  'Bowling',
  'Pool',
  'Darts',
  'Billiards',
]..sort(
  (a, b) => a.toLowerCase().compareTo(b.toLowerCase()),
);

class OnboardingProvider extends StateNotifier<OnboardingState> {
  final ICountryService countryService;
  final User? user;

  OnboardingProvider({
    required this.countryService,
    required this.user,
  }) : super(OnboardingState(
          games: _games,
          game: user?.game,
          country: user?.country,
          state: user?.state,
          city: user?.city,
        )) {
    if (user?.country != null) {
      unawaited(fetchStates(country: user!.country!));
    }
    if (user?.state != null) {
      unawaited(fetchCities(state: user!.state!));
    }
  }

  void setGame(String? game) {
    state = state.copyWith(game: game);
  }

  void setCountry(String country) {
    state = state.copyWith(
      country: country,
      state: () => null,
      city: () => null,
      states: [],
      cities: [],
    );
    unawaited(fetchStates(country: country));
  }

  void setState(String? state) {
    this.state = this.state.copyWith(
      state: () => state,
      city: () => null,
      cities: [],
    );
    if (state != null) {
      unawaited(fetchCities(state: state));
    }
  }

  void setCity(String? city) {
    state = state.copyWith(city: () => city);
  }

  Future<void> fetchCountries() async {
    try {
      if (state.countries.isNotEmpty) {
        return;
      }
      state = state.copyWith(status: OnboardingStatus.loadingCountry);
      final countries = await countryService.getCountries();
      state = state.copyWith(
        countries: countries,
        status: OnboardingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: OnboardingStatus.errorCountry);
      rethrow;
    }
  }

  Future<void> fetchStates({required String country}) async {
    try {
      state = state.copyWith(status: OnboardingStatus.loadingState);
      final states = await countryService.getStates(countryName: country);
      state = state.copyWith(
        states: states,
        status: OnboardingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(status: OnboardingStatus.errorState);
      JpNotification.error('Error fetching states');
    }
  }

  Future<void> fetchCities({required String state}) async {
    try {
      this.state = this.state.copyWith(status: OnboardingStatus.loadingCity);
      final cities = await countryService.getCities(stateName: state);
      this.state = this.state.copyWith(
            cities: cities.isEmpty ? [state] : cities,
            status: OnboardingStatus.success,
          );
    } catch (e) {
      this.state = this.state.copyWith(status: OnboardingStatus.errorCity);
      JpNotification.error('Error fetching cities');
    }
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingProvider, OnboardingState>((ref) {
  return OnboardingProvider(
    countryService: getIt<ICountryService>(),
    user: ref.read(appProvider.select((value) => value.user)),
  );
});
