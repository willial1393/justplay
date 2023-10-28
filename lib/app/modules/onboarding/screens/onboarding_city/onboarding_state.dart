class OnboardingState {
  final String? country;
  final String? state;
  final String? city;

  final List<String> countries;

  final List<String> states;
  final List<String> cities;

  OnboardingState({
    this.country,
    this.state,
    this.city,
    this.countries = const [],
    this.states = const [],
    this.cities = const [],
  });

  OnboardingState copyWith({
    String? country,
    String? state,
    String? city,
    List<String>? countries,
    List<String>? states,
    List<String>? cities,
  }) {
    return OnboardingState(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
    );
  }
}
