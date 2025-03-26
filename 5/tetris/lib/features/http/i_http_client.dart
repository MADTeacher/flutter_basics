import 'package:http/http.dart';

abstract interface class IHttpClient {
  Future<Response> post(String url, {Object? body});
  Future<Response> get(String url);
  Future<Response> put(String url, {Object? body});
}
