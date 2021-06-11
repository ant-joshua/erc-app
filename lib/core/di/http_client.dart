import 'package:dio/dio.dart';
import 'package:erc_app/core/helpers/storage.helpers.dart';
import 'package:erc_app/core/services/http_service.dart';

class HttpClient extends HttpService {
  final Dio? _client = Dio();

  HttpClient() {
    _client!.interceptors.add(_interceptor());
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) async {
      final storageToken = await StorageHelper.get("Token");
      // final storageToken = await StorageHelper.get(StorageKeys.token);

      if (storageToken != null) {
        options.headers.addAll({
          "Authorization": 'Bearer $storageToken',
        });
      }

      return handler.next(options);
    }, onError: (DioError e, handler) {
      if (e.response!.statusCode == 401) {
        print(e.message);
      }
      return handler.next(e);
    });
  }

  Future<Response> get(String url) => _client!.get(url);
  Future<Response> post(String url, {dynamic body}) =>
      _client!.post(url, data: body);
  Future<Response> put(String url, {dynamic body}) =>
      _client!.put(url, data: body);
  Future<Response> delete(String url, {dynamic body}) => _client!.delete(url);
}
