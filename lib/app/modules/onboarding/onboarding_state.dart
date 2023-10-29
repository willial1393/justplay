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
  final String? game;
  final String? country;
  final String? state;
  final String? city;

  final List<String> games;
  final List<String> countries;
  final List<String> states;
  final List<String> cities;

  final OnboardingStatus status;

  OnboardingState({
    this.country,
    this.state,
    this.city,
    this.game,
    this.countries = const [],
    this.states = const [],
    this.cities = const [],
    this.status = OnboardingStatus.loadingCountry,
    this.games = const [],
  });

  OnboardingState copyWith({
    String? country,
    String? Function()? state,
    String? Function()? city,
    List<String>? countries,
    List<String>? states,
    List<String>? cities,
    List<String>? games,
    OnboardingStatus? status,
    String? game,
  }) {
    return OnboardingState(
      country: country ?? this.country,
      state: state != null ? state() : this.state,
      city: city != null ? city() : this.city,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      cities: cities ?? this.cities,
      status: status ?? this.status,
      games: games ?? this.games,
      game: game ?? this.game,
    );
  }
}
