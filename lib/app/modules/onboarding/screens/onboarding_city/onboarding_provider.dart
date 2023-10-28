import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justplay/app/modules/onboarding/screens/onboarding_city/onboarding_state.dart';
import 'package:justplay/core/services/i_country_service.dart';
import 'package:justplay/injectable.dart';

class OnboardingProvider extends StateNotifier<OnboardingState> {
  final ICountryService countryService;

  OnboardingProvider({required this.countryService}) : super(OnboardingState());

  Future<void> fetchCountries() async {
    if (state.countries.isNotEmpty) {
      return;
    }
    final countries = await countryService.getCountries();
    state = state.copyWith(countries: countries);
  }

  void setCountry(String country)  {
    state = state.copyWith(country: country);
  }

  void setState(String state)  {
    this.state = this.state.copyWith(state: state);
  }

  void setCity(String city)  {
    state = state.copyWith(city: city);
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingProvider, OnboardingState>((ref) {
  return OnboardingProvider(
    countryService: getIt<ICountryService>(),
  );
});
