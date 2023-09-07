import 'package:demo_bloc_currency/core/utils/common.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClient {
  late Dio _dio;

  RestClient() {
    var options = BaseOptions(
      baseUrl: Common.baseURL,
      headers: {'X-Api-Key': 'VgmQ1tpCClf8rhyI2fvGbw==KGhapJldyIvkHW2f'},
    );
    _dio = Dio(options);
    // _dio.interceptors.add(CustomInterceptors());
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(path, queryParameters: data).then((value) => value);
  }

  Future<Response<dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio
        .post(path, data: data, queryParameters: queryParameters)
        .then((value) => value);
  }
}
