enum OnboardingStatus {
  loadingCountry,
  loadingState,
  loadingCity,
  errorCountry,
  errorState,
  errorCity,
  success,
}

class OnboardingState {
  final String? country;
  final String? state;
  final String? city;

  final List<String> countries;
  final List<String> states;
  final List<String> cities;

  final OnboardingStatus status;

  OnboardingState({
    this.country,
    this.state,
    this.city,
    this.countries = const [],
    this.states = const [],
    this.cities = const [],
    this.status = OnboardingStatus.loadingCountry,
  });

  OnboardingState copyWith({
    String? country,
    String? Function()? state,
    String? Function()? city,
    List<String>? countries,
    List<String>? states,
    List<String>? cities,
    OnboardingStatus? status,
  }) {
    return OnboardingState(
      country: country ?? this.country,
      state: state != null ? state() : this.state,
      city: city != null ? city() : this.city,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
      status: status ?? this.status,
    );
  }
}
