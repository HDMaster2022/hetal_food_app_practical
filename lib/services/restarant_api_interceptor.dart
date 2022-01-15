import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  ApiInterceptors();
  final _cache = new Map<Uri, Response>();

  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return options;
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    _cache[response.requestOptions.uri] = response;
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler) async {
    print('onError: $err');
    if (err.type == DioErrorType.connectTimeout || err.type == DioErrorType.other) {
      var cachedResponse = _cache[err.requestOptions.uri];
      if (cachedResponse != null) {
        return cachedResponse;
      }
    }
    return err;
  }

}