import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:justplay/core/services/i_country_service.dart';
import 'package:justplay/data/helpers/country_interceptor.dart';

@Injectable(as: ICountryService)
class CountryService implements ICountryService {
  final dio = Dio()
    ..interceptors.addAll([
      LogInterceptor(),
      CountryInterceptor(),
    ]);

  @override
  Future<List<String>> getCountries() async {
    final response =
        await dio.get('https://www.universal-tutorial.com/api/countries/');
    return (response.data as List)
        .map((e) => e?['country_name'] as String)
        .toList();
  }

  @override
  Future<List<String>> getCities({required String stateName}) async {
    final response = await dio
        .get('https://www.universal-tutorial.com/api/cities/$stateName');
    return (response.data as List)
        .map((e) => e['city_name'] as String)
        .toList();
  }

  @override
  Future<List<String>> getStates({required String countryName}) async {
    final response = await dio.get(
      'https://www.universal-tutorial.com/api/states/$countryName',
    );
    return (response.data as List)
        .map((e) => e['state_name'] as String)
        .toList();
  }
}
