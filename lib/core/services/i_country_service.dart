
abstract class ICountryService {
  Future<List<String>> getCountries();

  Future<List<String>> getStates({required String countryName});

  Future<List<String>> getCities({required String stateName});
}
