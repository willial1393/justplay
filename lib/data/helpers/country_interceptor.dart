import 'package:dio/dio.dart';
import 'package:justplay/environments.dart';

class CountryInterceptor extends QueuedInterceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final res = await Dio().get(
        'https://www.universal-tutorial.com/api/getaccesstoken',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'api-token': Env.countryApiKey,
            'user-email': Env.countryApiEmail,
          },
        ),
      );
      final token = res.data?['auth_token'];
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    } catch (e) {
      return handler.reject(DioException(
        requestOptions: options,
        error: e,
        type: DioExceptionType.unknown,
      ));
    }
  }
}
